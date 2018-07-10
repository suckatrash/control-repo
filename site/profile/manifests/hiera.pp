class profile::hiera (

  $hiera_yaml = "${::settings::confdir}/hiera.yaml"
){

  class { 'hiera':
          hiera_version   =>  '5',
          hiera5_defaults =>  {"datadir" => "/etc/puppetlabs/code/environments/%{environment}/hieradata", "data_hash" => "yaml_data"},
          hierarchy       =>  [
                                {"name" =>  "clientcert", "path"  =>  "nodes/%{trusted.certname}.yaml"},
                                {"name" =>  "Network", "path" =>  "%{facts.network}.yaml"},
                                {"name" =>  "environment", "path"  =>  "role/%{::role}-%{::env}.yaml"},
                                {"name" =>  "role", "path"  =>  "role/%{::role}.yaml"},
                                {"name" =>  "Default yaml file", "path" =>  "common.yaml"},
                              ],
    hiera_yaml => $hiera_yaml,
    #datadir    => '/etc/puppetlabs/code/environments/%{environment}/hieradata',
    owner      => 'pe-puppet',
    group      => 'pe-puppet',
    notify     => Service['pe-puppetserver'],
  }
}
