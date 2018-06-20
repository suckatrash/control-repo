class profile::t30217 {

  include puppet_enterprise::packages
  Package <| tag == 'pe-master-packages' |>
  
  include puppet_enterprise::master::file_sync_disabled
  
  puppet_enterprise::trapperkeeper::bootstrap_cfg { 'certificate-authority-service' :
    container => 'puppetserver',
    namespace => 'puppetlabs.services.ca.certificate-authority-disabled-service',
    service   => 'certificate-authority-disabled-service',
    require   => Package['pe-puppetserver'],
    notify    => Service['pe-puppetserver'],
  }

#puppet_enterprise::trapperkeeper::pe_service { 'puppetserver' : }
#  service {'pe-puppetserver':
#    ensure => running,
#    enable => true,
#  }
 
}
