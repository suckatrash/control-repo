class test::get_dat_password {

user {'user1':
  ensure => present,
  password => get_dat_password(user1,test),
}

user {'user2':
  ensure => present,
  password => get_dat_password(user2,test),
}

user {'user3':
  ensure => present,
  password => get_dat_password(user3,test),
}

user {'user4':
  ensure => present,
  password => get_dat_password(user4,test),
}

user {'user5':
  ensure => present,
  password => get_dat_password(user5,test),
}

user {'user6':
  ensure => present,
  password => get_dat_password(user6,test),
}

}
