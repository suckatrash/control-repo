class test::midserver  

  $dest     = "F:\\ServiceNow"
  
  file { "$dest":
    ensure => directory,
  }
  
}
