class profile::t30217 {

puppet_enterprise::trapperkeeper::pe_service { 'pe-puppetserver' : }
#  service {'pe-puppetserver':
#    ensure => running,
#    enable => true,
#  }
 
}
