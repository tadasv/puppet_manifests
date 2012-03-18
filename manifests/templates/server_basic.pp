node server_basic {
  include package::puppet
  include package::openssh_server
  include package::openntpd

  group { ubuntu:
    ensure => present,
  }

  user { ubuntu:
    comment => "Ubuntu",
    home => "/home/ubuntu",
    shell => "/bin/bash",
    gid => ubuntu,
  }

  package { [vim, wget, curl, git-core]:
    ensure => installed
  }
}
