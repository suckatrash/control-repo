define accounts::user (

$email = undef,
$key = undef,
$shell = '/bin/zsh',

){

if $name == 'root' { $home = '/root' } else { $home = "/home/${name}" }

ssh_authorized_key { $email:
  ensure => present,
  user   => ${name},
  type   => 'ssh-rsa',
  key    => $key,
  require => File["${home}"],
}

user { $name:
  ensure         => present,
  purge_ssh_keys => true,
  shell          => $shell,
  home           => "${home}",
  managehome     => 'true',
  #require        => File["/home/${name}"],
}

exec { "ohmyzsh::git clone ${name}":
  creates => "${home}/.oh-my-zsh",
  command => "/usr/bin/git clone https://github.com/robbyrussell/oh-my-zsh.git ${home}/.oh-my-zsh",
  #user    => $name,
  require => [Package['git'], Package['zsh'], User[${name}]]
}

exec { "ohmyzsh::cp .zshrc ${name}":
  creates => "${home}/.zshrc",
  command => "/bin/cp ${home}/.oh-my-zsh/templates/zshrc.zsh-template ${home}/.zshrc",
  user    => ${name},
  require => [Exec["ohmyzsh::git clone ${name}"], User[${name}]]
}

file_line { "${name}-agnoster-install":
  path    => "${home}/.zshrc",
  line    => "ZSH_THEME=\"agnoster\"",
  match   => '^ZSH_THEME',
  #require => User[$name],
}

file { "${home}":
  ensure            =>  directory,
  owner             =>  ${name},
  group             =>  ${name},
  mode              =>  '0750',
  require           =>  User[$name],
  }
}

file { "${home}/.vimrc":
  ensure    => file,
  owner     => ${name},
  group     => ${name},
  mode      => '0750',
  content   => 'colorscheme elflord',
}
