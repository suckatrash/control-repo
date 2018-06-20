class profile::t30217 {

  service {'pe-puppetserver':
    ensure => running,
    enable => true,
  }
 
}
