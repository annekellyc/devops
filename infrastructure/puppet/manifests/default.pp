Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

class system-update {
  exec { 'apt-get update':
    command => 'apt-get update',
  }

  $sysPackages = [ "build-essential" ]
  package { $sysPackages:
    ensure => "installed",
    require => Exec['apt-get update'],
  }
}

class openjdk8 {
  package { "software-properties-common":
    ensure  => present,
    require => Class["system-update"],
  }
  package { "python-software-properties":
    ensure  => present,
    require => Class["system-update"],
  }

  exec { 'add-apt-repository':
    command => 'add-apt-repository ppa:openjdk-r/ppa',
  }

  package { "openjdk-8-jdk":
    ensure  => present,
    require => Class["system-update"],
  }

}

include system-update
include openjdk8