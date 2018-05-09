class puppet_workstation_install::tools {

  package {'git': ensure  => "installed" }
  package {'openssh-client': ensure  => "installed" }
  package {'ssh-askpass': ensure  => "installed" }
  package {'ssh-askpass-gnome': ensure  => "installed" }
  package {'curl': ensure  => "installed" }
  package {'terminator': ensure  => "installed" }
  package {'chromium-browser': ensure  => "installed" }
  package {'nautilus-dropbox': ensure  => "installed" }
  package {'virtualbox': ensure  => "installed" }
  package {'gmpc': ensure  => "installed" }
  package {'ack-grep': ensure  => "installed" }
  package {'net-tools': ensure  => "installed" }

  package {'firefox': ensure  => "absent" }

}
