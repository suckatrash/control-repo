pe_postgresql::server::pg_hba_rule{ 'allow telegraf user':
  type => 'hostnossl',
  database => 'pe-puppetdb',
  user     => 'telegraf',
  auth_method => 'password',
  address     => '192.168.0.8',
}
