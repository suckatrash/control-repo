class test::export {

@@user {'bob':
  ensure => present,
}

User <<| |>>

}
