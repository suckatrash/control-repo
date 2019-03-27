class test::nic_team {

  pspackageprovider {'Nuget':
    ensure   => 'present',
    provider => 'windowspowershell',
    before   => Package['NetworkingDsc'],
  }

  package { 'NetworkingDsc':
    ensure   => latest,
    provider => 'windowspowershell',
    source   => 'PSGallery',
    before   => [Dsc['nic_team1-HyperV'],Dsc['nic_team2-Vlan22']],
  }

  dsc {'nic_team1-HyperV':
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
  
  dsc {'nic_team2-Vlan22':
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
  
  dsc {'set-ip-team2':
    resource_name => 'IPAddress',
    module        => 'NetworkingDsc',
    properties    => {
      ensure    => 'present',
      ipaddress => '10.32.22.11/15',
      addressfamily => 'IPV4',
    }
  }
}
