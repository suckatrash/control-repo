class profile::webserver {

class { 'apache':
  default_vhost => false,
}

apache::vhost { 'test.example.com':
  port          => '80',
  docroot       => '/var/www/html',
  docroot_owner => 'apache',
  docroot_group => 'apache',
}

file {'/var/www/html/index.html':
  ensure => file,
  mode => '444',
  owner => 'apache',
  source => '/etc/motd',
}

}
