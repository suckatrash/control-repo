class test::fileserver {

  file { '/etc/sudoers.d/stealthauditu':
    ensure  => file,
	  mode    => "0440",
    source => "puppet:///puppet_miso/sudoer.pp/stealthauditu",
  }
  
  }
