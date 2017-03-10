define accounts::user (

$email = undef,
$key = undef,
$shell = '/bin/bash',

){

ssh_authorized_key { $email:
  ensure => present,
  user   => $name,
  type   => 'ssh-rsa',
  key    => $key,
  require => File["/home/$name"],
}

user { $name:
  ensure         => present,
  purge_ssh_keys => true,
  shell          => $shell,
  home           => "/home/$name",
  managehome     => 'true',
  #require        => File["/home/$name"],
}


file { "/home/$name":
  ensure            =>  directory,
  owner             =>  $name,
  group             =>  $name,
  mode              =>  '0750',
  require           =>  User[$name],
  }
}


