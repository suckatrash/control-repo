class mounts::server {
  file { '/data':
    ensure => 'directory',
    selinux_ignore_defaults => true,
  }

  class { 'nfs::server':
    nfs_v4 => true,
    nfs_v4_export_root_clients =>
      '*(rw,fsid=root,insecure,no_subtree_check,async,no_root_squash)'
  }
  nfs::server::export{ '/data':
    ensure  => 'mounted',
    clients => '*(rw,insecure,no_subtree_check,async,no_root_squash) localhost(rw)'
  }

}
