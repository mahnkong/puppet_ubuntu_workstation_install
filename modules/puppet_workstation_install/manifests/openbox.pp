class puppet_workstation_install::openbox {

  package {'openbox': ensure  => "installed" }
  package {'tint2': ensure  => "installed" }
  package {'x11-apps': ensure  => "installed" }
  package {'rofi': ensure  => "installed" }
  package {'lightdm': ensure  => "installed" }
  package {'xscreensaver': ensure  => "installed" }
  package {'gdm3': ensure  => "absent" }


  file {"${::builduserhome}/.config/openbox":
    owner  => $::builduser,
    group  => $::builduser,
    ensure =>  'directory'
  }

  file { "${::builduserhome}/.config/openbox/environment":
    ensure => 'link',
    owner  => $::builduser,
    group  => $::builduser,
    target => "${::builduserhome}/environment"
  }

  file {"${::builduserhome}/.xscreensaver":
    ensure => present,
    owner  => $::builduser,
    group  => $::builduser,
    source => "puppet:///modules/puppet_workstation_install/openbox/_xscreensaver",
  }

  file {"${::builduserhome}/.config/openbox/rc.xml":
    ensure => present,
    owner  => $::builduser,
    group  => $::builduser,
    source => "puppet:///modules/puppet_workstation_install/openbox/rc.xml",
  }

  file {"${::builduserhome}/.config/openbox/autostart":
    ensure => present,
    owner  => $::builduser,
    group  => $::builduser,
    source => "puppet:///modules/puppet_workstation_install/openbox/autostart",
  }

  file {"${::builduserhome}/bin/toggletint2.sh":
    ensure => present,
    owner  => $::builduser,
    group  => $::builduser,
    mode   => "0755",
    source => "puppet:///modules/puppet_workstation_install/openbox/toggletint2.sh",
  }


  file {"${::builduserhome}/bin/togglexclock.sh":
    ensure => present,
    owner  => $::builduser,
    group  => $::builduser,
    mode   => "0755",
    source => "puppet:///modules/puppet_workstation_install/openbox/togglexclock.sh",
  }


}
