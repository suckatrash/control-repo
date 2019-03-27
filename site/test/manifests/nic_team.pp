class test::nic_team {

  exec { 'NetworkTeam-Install':
    command   => 'Install-Module -Name NetworkingDsc -Force',
    provider  => 'powershell',
    before    => [Dsc['nic_team1'],Dsc['nic_team2']],
  }

  dsc {'nic_team1':
    resource_name => 'NetworkTeam',
    module        => 'NetworkingDsc',
    properties    => {
      ensure                 => 'present',
      name                   => 'Team1 - HyperV',
      teamingmode            => 'SwitchIndependent',
      loadbalancingalgorithm => 'HyperVPort',
      teammembers            => ['NIC1', 'NIC2'],
    }
  }
  
  dsc {'nic_team2':
    resource_name => 'NetworkTeam',
    module        => 'NetworkingDsc',
    properties    => {
      ensure                 => 'present',
      name                   => 'Team2 - VLAN 22',
      teamingmode            => 'SwitchIndependent',
      loadbalancingalgorithm => 'HyperVPort',
      teammembers            => ['NIC3', 'NIC4'],
    }
  }
}
