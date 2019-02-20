class test::install_hyperv {

  windowsfeature { 'Hyper-V':
    ensure => present,
  }


}
