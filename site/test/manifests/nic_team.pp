class test::nic_team {

  dsc_networkteam{ 'team1':
    dsc_ensure                 => 'present',
    dsc_name                   => 'Team1 - HyperV',
    dsc_teammembers            => ['NIC1','NIC2'],
    dsc_teamingmode            => 'SwitchIndependent',
    dsc_loadbalancingalgorithm => 'Dynamic',
  }
  
  dsc_networkteam{ 'team2':
    dsc_ensure                 => 'present',
    dsc_name                   => 'Team2 - VLAN 22',
    dsc_teammembers            => ['NIC3','NIC4'],
    dsc_teamingmode            => 'SwitchIndependent',
    dsc_loadbalancingalgorithm => 'Dynamic',
  }
}
