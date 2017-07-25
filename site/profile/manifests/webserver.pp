class profile::webserver {

class { 'apache':
  default_vhost => false,
}

apache::vhost { 'test.example.com':
  port          => '80',
  docroot       => '/var/www/html',
  docroot_owner => 'www-data',
  docroot_group => 'www-data',
}

file {'/var/www/html/index.html':
  ensure => file,
  mode => 444,
  owner => 'www-data',
  source => '/etc/motd',
}

}
