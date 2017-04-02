class packages::base {

$oneswewant = ['tree','expect','telnet','zsh','git','vim','curl']

package {$oneswewant:
  ensure => installed,
}

}

