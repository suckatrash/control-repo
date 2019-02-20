class test::install_hyperv {

  windowsfeature { 'Microsoft-Hyper-V':
    ensure => present,
  }

  reboot {'after_Microsoft_Hyper_V':
    when  => pending,
    subscribe => Windowsfeature['Microsoft-Hyper-V'],
  }

}
