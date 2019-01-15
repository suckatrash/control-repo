class accounts::test {

  user {'test':
    ensure => present,
    password => lookup(accounts::test::password)
  }


}
