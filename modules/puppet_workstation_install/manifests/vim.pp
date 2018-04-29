class puppet_workstation_install::vim {

  package {'vim-gnome': ensure  => "installed" }

  file {"${::builddir}/vimsetup.sh": 
    ensure => present,
    content => template("puppet_workstation_install/vim/vimsetup.sh.erb"),
    notify => Exec["/bin/bash ${::builddir}/vimsetup.sh"]
  }

  exec {"/bin/bash ${::builddir}/vimsetup.sh":
    refreshonly => true,
    user        => $::builduser,
    require     => Package['vim-gnome', 'git']
  }

}
