class test::get_dat_password {

user {'user1':
  ensure => present,
  password => pw_hash(get_dat_password('user1'),'SHA-256',salt),,
}

user {'user2':
  ensure => present,
  password => pw_hash(get_dat_password('user2'),'SHA-256',salt),
}

user {'user3':
  ensure => present,
  password => pw_hash(get_dat_password('user3'),'SHA-256',salt),
}

user {'user4':
  ensure => present,
  password => pw_hash(get_dat_password('user4'),'SHA-256',salt),
}

user {'user5':
  ensure => present,
  password => pw_hash(get_dat_password('user5'),'SHA-256',salt),
}

user {'user6':
  ensure => present,
  password => pw_hash(get_dat_password('user6'),'SHA-256',salt),
}

}
