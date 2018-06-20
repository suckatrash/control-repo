class profile::30217 {

  service {'pe-puppetserver':
    ensure => running,
    enabled => true,
  }
 
}
