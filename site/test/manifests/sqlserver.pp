class test::sqlserver {

  sqlserver_instance{ 'yourmom':
    features                => ['SQL'],
    source                  => 'D:/',
    sql_sysadmin_accounts   => ['myuser'],
  }
}
