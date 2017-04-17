class profile::iaas_good_d1 {

  case $::kernel {

    'windows': {
      file { 'C:\Temp\ThisIsIaas_Good_D1':
        ensure => file,
        require => Exec['sleep'],
      }
      exec { 'sleep':
        command => 'C:\Windows\System32\ping.exe 127.0.0.1 -n 181',
        creates => 'C:\Temp\ThisIsIaas_Good_D1",
        timeout => 600,
      }

    }


    'Linux': {
      file { '/tmp/ThisIsIaas_Good_D1':
        ensure => file,
        require => Exec['sleep'],
      }
      exec { 'sleep':
        command => '/bin/ping 127.0.0.1 -c 181',
        creates => '/tmp/ThisIsIaas_Good_D1',
        timeout => 600,
      }

    }

  }

}
