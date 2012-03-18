import "classes/*.pp"
#import "classes/python/*.pp"
import "classes/package/*.pp"
import "templates/*.pp"

Exec {
  path => ["/bin", "/sbin", "/usr/bin", "/usr/sbin"],
  logoutput => on_failure,
}

File {
  owner => root,
  group => root,
  mode => 644,
}

import "nodes*.pp"
