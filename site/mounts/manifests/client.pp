class mounts::client {
  class { 'nfs::client':
    nfs_v4              => true,
    nfs_v4_idmap_domain => $::domain,
    nfs_v4_mount_root   => '/data',
  }

  Nfs::Client::Mount <<| |>>

}
