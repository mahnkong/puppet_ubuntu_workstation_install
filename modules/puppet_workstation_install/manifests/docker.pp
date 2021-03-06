class puppet_workstation_install::docker {

  package {'apt-transport-https': ensure  => "installed"}
  package {'ca-certificates': ensure  => "installed"}
  package {'software-properties-common': ensure  => "installed"}

  file {"${::builddir}/docker.gpg":
    ensure => present,
    source => "puppet:///modules/puppet_workstation_install/docker/docker.gpg",
    notify => Exec["/usr/bin/apt-key add ${::builddir}/docker.gpg"]
  }

  exec {"/usr/bin/apt-key add ${::builddir}/docker.gpg":
    refreshonly => true,
    notify      => Exec["/usr/bin/add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu $::lsbdistcodename stable'"]
  }

  exec {"/usr/bin/add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu $::lsbdistcodename stable'":
    refreshonly => true
  }

  package {'docker-ce':
    ensure  => "installed",
    require => Exec["/usr/bin/add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu $::lsbdistcodename stable'"]
  }
}
