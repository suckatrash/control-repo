class test2::midserver {
  
  $agentdir = "C:\\test\\notarealfolder"
  
  file { "test":
    ensure => file,
    mode => '0664',
    backup => false,
    replace => true,
    path => "${agentdir}/agent/test.xml",
    content => template('test2/config.xml.erb'),
  }
  
}
