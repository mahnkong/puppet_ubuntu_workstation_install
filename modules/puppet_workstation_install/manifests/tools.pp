class puppet_workstation_install::tools {

  package {'git': ensure  => "installed" }
  package {'terminator': ensure  => "installed" }
  package {'chromium-browser': ensure  => "installed" }
  package {'dropbox': ensure  => "installed" }
  package {'keepass2': ensure  => "installed" }

}
