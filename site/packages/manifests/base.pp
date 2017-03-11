class packages::base {

package {'tree':
  ensure => installed,
}

package {'expect':
  ensure => installed,
}

package {'telnet':
  ensure => installed,
}

package { 'zsh':
  ensure => present,
}

package { 'git':
  ensure => present,
}

}

