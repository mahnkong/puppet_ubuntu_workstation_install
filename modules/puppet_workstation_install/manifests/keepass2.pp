class puppet_workstation_install::keepass2 {

  package {'mono-complete': ensure  => "installed" }
  package {'libmono-system-xml-linq4.0-cil': ensure  => "installed" }
  package {'libmono-system-data-datasetextensions4.0-cil': ensure  => "installed" }
  package {'libmono-system-runtime-serialization4.0-cil': ensure  => "installed" }
  package {'mono-mcs': ensure  => "installed" }
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

  file {"${::builddir}/install_keepasshttp.sh": 
    ensure => present,
    content => template("puppet_workstation_install/keepass2/install_keepasshttp.sh.erb"),
    notify => Exec["/bin/bash ${::builddir}/install_keepasshttp.sh"]
  }

  exec {"/bin/bash ${::builddir}/install_keepasshttp.sh":
    refreshonly => true,
    require     => Package['keepass2','curl']
  }

}
