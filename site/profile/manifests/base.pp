class profile::base {

include motd
include packages::base

class { '::ntp':
  servers => [ '0.pool.ntp.org', '1.pool.ntp.org', '2.pool.ntp.org', '3.pool.ntp.org' ],
  restrict => [ '127.0.0.1' ],
}

}
