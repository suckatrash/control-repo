class test::jetty_mod {

  pe_hocon_setting { 'puppetserver.webserver.pe-puppetserver.request-body-max-size':
    ensure  => present,
    setting => 'webserver.puppet-server.request-body-max-size',
    value   => '512000000',
    path    => '/etc/puppetlabs/puppetserver/conf.d/webserver.conf',
    notify  => Service['pe-puppetserver'],
  }

}
