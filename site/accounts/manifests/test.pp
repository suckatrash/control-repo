class accounst::test {

  user {'test':
    ensure => present,
    password => str2saltedsha512(lookup(accounts::test::password))
  }


}
