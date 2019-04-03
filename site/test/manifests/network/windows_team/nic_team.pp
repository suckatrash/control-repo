define test::network::windows_team::nic_team (
  String[1]                                                                  $nic_name,
  Array[String]                                                              $teammembers,
  Enum['SwitchIndependent','LACP','Static']                                  $teamingmode = 'SwitchIndependent',
  Enum['Dynamic','HyperVPort','IPAddresses','MacAddresses','TransportPorts'] $loadbalancingalgorithm = 'HyperVPort',
  Enum['IPv4','IPv6']                                                        $addressfamily = 'IPv4',
  Optional[Array[Stdlib::IP::Address]]                                       $ipaddress = undef,
  Optional[Stdlib::IP::Address]                                              $gw_address = undef,
){

  include test::network::windows_team::install_dsc_modules

  dsc {$name:
    resource_name => 'NetworkTeam',
    module        => 'NetworkingDsc',
    properties    => {
      name                   => $nic_name,
      teamingmode            => $teamingmode,
      loadbalancingalgorithm => $loadbalancingalgorithm,
      teammembers            => $teammembers,
    },
    require       => Class['test::network::windows_team::install_dsc_modules'],
  }

  if $ipaddress {

    test::network::windows_team::interface { "${name}-interface":
      ipaddress      => $ipaddress,
      gw_address     => $gw_address,
      interfacealias => $nic_name,
      require        => Dsc[$name],
    }
  }
}
