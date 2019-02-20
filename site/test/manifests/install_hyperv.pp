class test::install_hyperv {

  windowsfeature { 'Hyper-V':
    ensure => present,
  }

  reboot {'after_RDS_RD_Server':
    when  => pending,
    subscribe => Windowsfeature['Hyper-V'],
  }

}
