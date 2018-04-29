class puppet_workstation_install::keepass2 {

  package {'mono-complete': ensure  => "installed" }
  package {'keepass2': ensure  => "installed" }

  file {"${::builduserhome}/.config/KeePass":
    owner  => $::builduser,
    group  => $::builduser,
    ensure =>  'directory'
  }

  file { "${::builduserhome}/.config/KeePass/KeePass.config.xml":
    ensure  => present,
    owner   => $::builduser,
    group   => $::builduser,
    content => template('puppet_workstation_install/keepass2/KeePass.config.xml.erb')
  }

}
