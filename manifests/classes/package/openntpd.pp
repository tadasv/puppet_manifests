#
# NTPD Setup
#

class package::openntpd {
  package { [openntpd]:
    ensure => installed
  }

  file { "/etc/timezone":
    content => "America/New_York",
    notify => Service["openntpd"],
    require => Package["openntpd"],
  }

  file { "/etc/localtime":
    ensure => "/usr/share/zoneinfo/America/New_York",
    notify => Service["openntpd"],
  }

  service { "openntpd":
    ensure => running,
    require => Package["openntpd"],
    pattern => "ntpd",
    hasrestart => true,
  }
}
