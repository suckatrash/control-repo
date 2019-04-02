class test::install_hyperv {

  test::network::windows_team::nic_team { 'nic_team1-HyperV':
    nic_name    => 'Team1 - HyperV',
    teammembers => ['NIC1', 'NIC2'],
  }

  test::network::windows_team::nic_team { 'nic_team2-Vlan22':
    nic_name    => 'Team2 - VLAN 22',
    teammembers => ['NIC3', 'NIC4'],
  }

  test::network::windows_team::interface { 'set-ip-team2':
    ipaddress      => ['10.32.22.11/23'],
    gw_address     => '10.32.22.1',
    interfacealias => 'Team2 - VLAN 22',
  }

}
