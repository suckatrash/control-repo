class test::midserver {
  
  $agentdir = "C:\\test\\notarealfolder"
  
  file { "test":
    ensure => file,
    path => "${agentdir}/agent/test.xml",
  }
  
}
