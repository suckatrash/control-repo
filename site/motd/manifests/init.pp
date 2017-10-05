class motd {

file {'/etc/motd':
  ensure => file,
  owner => 'root',
  group => 'root',
  content => template('motd/motd.erb'),
  #source => 'puppet:///modules/motd/motd',
}

}
