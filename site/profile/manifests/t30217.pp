class profile::t30217 {

  include puppet_enterprise::packages
  Package <| tag == 'pe-master-packages' |>
  
  puppet_enterprise::trapperkeeper::bootstrap_cfg { 'certificate-authority-service' :
    container => 'puppetserver',
    namespace => 'puppetlabs.enterprise.services.reverse-proxy.reverse-proxy-ca-service',
    service   => 'reverse-proxy-ca-service',
    require   => Package['pe-puppetserver'],
    notify    => Service['pe-puppetserver'],
  }

#puppet_enterprise::trapperkeeper::pe_service { 'puppetserver' : }
#  service {'pe-puppetserver':
#    ensure => running,
#    enable => true,
#  }
 
}
