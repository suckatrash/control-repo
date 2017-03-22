class packages::base {

$oneswewant = ['tree','expect','telnet','zsh','git','vim']

package {$oneswewant:
  ensure => installed,
}

}

