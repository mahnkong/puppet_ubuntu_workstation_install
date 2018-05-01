class puppet_workstation_install::devtools {

  package {'nodejs': ensure  => "installed" }
  package {'npm': ensure  => "installed" }

  exec {'/usr/bin/snap install android-studio --classic':
  }

}
