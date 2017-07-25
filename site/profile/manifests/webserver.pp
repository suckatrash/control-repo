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
  content => template('profile/index.html.erb'),
}->

file {'/var/www/html/css':
  ensure => directory,
  mode => '444',
  owner => 'apache',
}->

file {'/var/www/html/css/style.css':
  ensure => file,
  mode => '444',
  owner => 'apache',
  content => 'div {
    white-space: pre-wrap;
  }',
}

}
