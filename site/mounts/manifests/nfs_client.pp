class nfs_client {

  file { '/data':
    ensure => directory,
  }

  mount { 'mount OSX share':
    ensure  => mounted,
    device  => '10.0.27.100:/Users/erikhansen/share',
    fstype  => 'nfs',
    name    => '/data',
    atboot  => true,
    require => File['/data'],  
  }
  
}
