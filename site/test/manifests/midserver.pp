class test::midserver {
  
  file { "test":
    ensure => file,
    path => "C:\\test\\somefolder\\test",
  }
  
}
