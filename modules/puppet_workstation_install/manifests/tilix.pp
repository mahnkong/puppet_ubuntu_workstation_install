class puppet_workstation_install::tilix {

  package {'tilix': ensure  => "installed" }

  file {"${::builddir}/tilix.conf":
    ensure => present,
    owner  => $::builduser,
    group  => $::builduser,
    mode   => "0755",
    notify => Exec["/usr/bin/dconf load /com/gexperts/Tilix/ < ${::builddir}/tilix.conf"],
    source => "puppet:///modules/puppet_workstation_install/tilix/tilix.conf",
  }

  file { '/etc/profile.d/vte.sh':
    ensure => 'link',
    target => '/etc/profile.d/vte-2.91.sh'
  }  

  exec {"/usr/bin/dconf load /com/gexperts/Tilix/ < ${::builddir}/tilix.conf":
    refreshonly => true,
    user        => $::builduser,
  }

}
