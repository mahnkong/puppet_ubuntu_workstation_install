class puppet_workstation_install::tools {

  package {'git': ensure  => "installed" }
  package {'openssh-client': ensure  => "installed" }
  package {'curl': ensure  => "installed" }
  package {'terminator': ensure  => "installed" }
  package {'chromium-browser': ensure  => "installed" }
  package {'nautilus-dropbox': ensure  => "installed" }
  package {'mono-complete': ensure  => "installed" }
  package {'keepass2': ensure  => "installed" }
  package {'virtualbox': ensure  => "installed" }

  package {'firefox': ensure  => "absent" }

}
