class puppet_workstation_install {

  file {"${::builduserhome}/.config":
    owner  => $::builduser,
    group  => $::builduser,
    ensure =>  'directory'
  }

  file {"${::builduserhome}/bin":
    owner  => $::builduser,
    group  => $::builduser,
    ensure =>  'directory'
  }

  file { "${::builduserhome}/environment":
    ensure => 'present',
    owner  => $::builduser,
    group  => $::builduser,
    source => "puppet:///modules/puppet_workstation_install/environment",
  }

  include puppet_workstation_install::backup
  include puppet_workstation_install::tools
  include puppet_workstation_install::vim
  include puppet_workstation_install::openbox
}
