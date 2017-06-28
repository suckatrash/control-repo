class sqltest {

sqlserver::config{ 'MSSQLSERVER':
  admin_user    => 'sa',
  admin_pass    => 'Password1',
  admin_login_type => 'SQL_LOGIN',
}

sqlserver_instance{'MSSQLSERVER':
  source => 'D:\',
  security_mode => 'SQL',
  sa_pwd => 'Password1',
  features => ['SQLEngine'],
  sql_sysadmin_accounts => ['Administrator'],
  #as_svc_account => 'Administrator',
  #as_svc_password => 'Password1',
} ->

sqlserver::login{'ERIK\ErikGroup':
  login_type  => 'WINDOWS_LOGIN',
}->
sqlserver::role{'ServerRole':
  instance    => 'MSSQLSERVER',
  ensure      => 'present',
  role        => 'sysadmin',
  type        => 'SERVER',
  members     => ['ERIK\ErikGroup'],
}

}
