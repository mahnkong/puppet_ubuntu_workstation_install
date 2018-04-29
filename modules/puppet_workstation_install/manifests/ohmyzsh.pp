class puppet_workstation_install::ohmyzsh {

  package {'zsh': ensure  => "installed" }

  user { "$::builduser":
    shell   => "/bin/zsh",
    require => Package['zsh'],
    notify  =>  Exec["/bin/bash ${::builddir}/ohmyzsh_setup.sh"]
  }

  file {"${::builddir}/ohmyzsh_setup.sh": 
    ensure => present,
    content => template("puppet_workstation_install/ohmyzsh/ohmyzsh_setup.sh.erb"),
    notify => Exec["/bin/bash ${::builddir}/ohmyzsh_setup.sh"]
  }

  exec {"/bin/bash ${::builddir}/ohmyzsh_setup.sh":
    refreshonly => true,
    user        => $::builduser,
    require     => Package['curl','git']
  }

}
