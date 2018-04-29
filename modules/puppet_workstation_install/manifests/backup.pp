class puppet_workstation_install::backup {

  package {'borgbackup':, 
    ensure => "installed",
  }

}
