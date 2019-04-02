define test::network::windows_team::nic_team (
  String[1]                                                                  $nic_name,
  Enum['SwitchIndependent','LACP','Static']                                  $teamingmode = 'SwitchIndependent',
  Enum['Dynamic','HyperVPort','IPAddresses','MacAddresses','TransportPorts'] $loadbalancingalgorithm = 'HyperVPort',
  Array[String]                                                              $teammembers,
){

  include test::network::windows_team::install_dsc_modules

  dsc {"$name":
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

}
