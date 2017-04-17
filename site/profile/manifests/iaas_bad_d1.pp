class profile::iaas_bad_d1 {

  case $::kernel {

    'windows': {
      file { 'C:\Temp\ThisIsIaas_Bad_D1':
        ensure => file,
        require => Exec['sleep'],
      }
      exec { 'sleep':
        command => 'ping 127.0.0.1 -n 181',
        creates => 'C:\Temp\ThisIsIaas_Bad_D1',
        path    => 'C:\',
        timeout => 600,
      }
      exec { 'badcopy':
        command => 'copy C:\Temp\BadFile1 C:\Temp\BadFile2',
        path    => 'C:\',
        require => Exec['sleep'],
      }

    }


    'Linux': {
      file { '/tmp/ThisIsIaas_Bad_D1':
        ensure => file,
        require => Exec['sleep'],
      }
      exec { 'sleep':
        command => '/bin/ping 127.0.0.1 -c 181',
        creates => '/tmp/ThisIsIaas_Bad_D1',
        timeout => 600,
      }
      exec { 'badcopy':
        command => '/bin/cp /tmp/BadFile1 /tmp/BadFile2',
        require => Exec['sleep'],
      }

    }

  }

}
