#!/bin/bash

if [[ $EUID > 0 ]] || [ "$SUDO_USER" = "" ]; then
    echo "Please run as sudo"
    exit 1
fi

FORCE_PUPPET_INSTALL="$1"
export FACTER_BUILDDIR="$(pwd)/build"
export FACTER_BUILDUSER=$SUDO_USER
export FACTER_BUILDUSERHOME=$(echo $(getent passwd $SUDO_USER )| cut -d : -f 6)

mkdir -p $FACTER_BUILDDIR
chown $FACTER_BUILDUSER:$FACTER_BUILDUSER $FACTER_BUILDDIR

apt update
if [ "$(which puppet 2>/dev/null)" = "" -o "$FORCE_PUPPET_INSTALL" != "" ]; then
    apt install -y puppet
fi
puppet apply --modulepath ./modules manifests/site.pp
