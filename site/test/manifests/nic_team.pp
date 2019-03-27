class test::nic_team {

  dsc {'nic_team1':
    resource_name => 'NetworkTeam',
    module        => 'NetworkingDsc',
    properties    => {
      Ensure                 => 'present',
      Name                   => 'Team1 - HyperV',
      TeamingMode            => 'SwitchIndependent',
      LoadBalancingAlgorithm => 'HyperVPort',
      TeamMembers            => ['NIC1', 'NIC2'],
    }
  }
  
  dsc {'nic_team2':
    resource_name => 'NetworkTeam',
    module        => 'NetworkingDsc',
    properties    => {
      Ensure                 => 'present',
      Name                   => 'Team2 - VLAN 22',
      TeamingMode            => 'SwitchIndependent',
      LoadBalancingAlgorithm => 'HyperVPort',
      TeamMembers            => ['NIC3', 'NIC4'],
    }
  }
}
