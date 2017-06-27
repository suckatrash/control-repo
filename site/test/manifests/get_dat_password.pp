class test::get_dat_password {

user {'user1':
  ensure => present,
  password => get_dat_password('user1'),
}

user {'user2':
  ensure => present,
  password => get_dat_password('user2'),
}

user {'user3':
  ensure => present,
  password => get_dat_password('user3'),
}

user {'user4':
  ensure => present,
  password => get_dat_password('user4'),
}

user {'user5':
  ensure => present,
  password => get_dat_password('user5'),
}

user {'user6':
  ensure => present,
  password => get_dat_password('user6'),
}

}
