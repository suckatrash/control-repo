class mounts::client {
  nfs::server::export{ '/data':
    ensure  => 'mounted',
    clients => '*(rw,insecure,no_subtree_check,async,no_root_squash) localhost(rw)',
    owner => 'root',
    group => 'root',
    perms => '0755',
  }
}
