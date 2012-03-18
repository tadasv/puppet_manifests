#
# Puppet configuration
#

class package::puppet {
  package { [puppet]:
    ensure => installed,
    notify => [ Exec[stop_puppetd], Exec[remove_puppetd_init] ],
  }

  # Run puppet as a cronjob every 10 mins
  cron { puppet_run:
    command => "puppetd --onetime > /dev/null 2>&1",
    minute => "*/10",
    environment => ["PATH=/bin:/sbin:/usr/bin:/usr/sbin"],
    require => Package["puppet"],
  }

  exec { "stop_puppetd":
    command => "/etc/init.d/puppet stop",
    refreshonly => true,
  }

  exec { "remove_puppetd_init":
    command => "update-rc.d -f puppet remove",
    refreshonly => true,
  }
}
