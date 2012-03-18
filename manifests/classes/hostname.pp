#
# sets the host name of a host
#

define hostname($name) {
  file { "/etc/hostname":
    content => "$name",
    notify => Exec["hostname"],
  }

  exec { "hostname":
    command => "hostname $name",
    refreshonly => true,
  }
}
