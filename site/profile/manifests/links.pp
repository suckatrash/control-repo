class profile::links {

if ! defined(File[“/usr/local/bin”]) {
  file { ‘/usr/local’:
  ensure => 'directory',
  replace => false,
}

file { '/usr/local/bin/inq':
  ensure => file,
  owner => 'root',
  group => 'root',
  replace => false,
  mode => '0755',
  content => "test",
}

file { '/usr/local/bin/mpio':
  ensure => file,
  owner => 'root',
  group => 'root',
  replace => false,
  mode => '0755',
  content => "test",
}

file { '/etc/test':
  ensure => file,
  owner => 'root',
  group => 'root',
  replace => false,
  mode => '0755',
  content => "test",
}

}
