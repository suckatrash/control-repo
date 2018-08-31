define accounts::user (

$email = undef,
$key = undef,
$shell = '/bin/zsh',

){

if $name == 'root' { $home = '/root' } else { $home = "/home/${name}" }

ssh_authorized_key { $email:
  ensure => present,
  user   => $name,
  type   => 'ssh-rsa',
  key    => $key,
  require => File["${home}"],
}

user { $name:
  ensure         => present,
  purge_ssh_keys => false,
  shell          => $shell,
  home           => "${home}",
  managehome     => 'true',
  #require        => File["/home/$name"],
}

exec { "ohmyzsh::git clone ${name}":
  creates => "${home}/.oh-my-zsh",
  command => "/usr/bin/git clone https://github.com/robbyrussell/oh-my-zsh.git ${home}/.oh-my-zsh",
  #user    => $name,
  require => [Package['git'], Package['zsh'], User[$name]]
}

file { "${home}/.zshrc":
  ensure            => file,
  source            => "puppet:///modules/accounts/zshrc",
  owner             =>  $name,
  group             =>  $name,
  require           => FILE[$home],
}

file { "${home}":
  ensure            =>  directory,
  owner             =>  $name,
  group             =>  $name,
  mode              =>  '0750',
  require           =>  User[$name],
}


file { "${home}/.vimrc":
  ensure    => file,
  owner     => $name,
  group     => $name,
  mode      => '0750',
  content   => 'colorscheme elflord',
}

}
