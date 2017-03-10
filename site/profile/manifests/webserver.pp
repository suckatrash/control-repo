class profile::webserver {

  class { 'apache':
    default_vhost => false,
  }

  apache::vhost { 'test.com':
    ip      => ['127.0.0.1',"$ipaddress"],
    port    => '8085',
    docroot => '/var/www/test.com',
    require => File['/var/www/test.com'],
  }


  file {'/var/www/test.com':
    ensure => directory,
    mode   => '0777',
  }

  file {'/var/www/test.com/index.html':
    ensure  => file,
    content => "<html><head><title>\"Hello World\"</title><body><marquee width=\"650\"><h1>\"Hello World from $::fqdn\"</h1></marquee></head></html>",
    mode    => '0777',
    require => File['/var/www/test.com'],
  }
}
