class profile::t30217 {

  include puppet_enterprise::packages
  Package <| tag == 'pe-master-packages' |>

#puppet_enterprise::trapperkeeper::pe_service { 'puppetserver' : }
#  service {'pe-puppetserver':
#    ensure => running,
#    enable => true,
#  }
 
}
