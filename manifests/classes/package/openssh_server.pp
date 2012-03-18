class package::openssh_server {
  package { [openssh-server]:
    ensure => installed
  }
}
