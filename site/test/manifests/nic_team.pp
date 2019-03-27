class test::nic_team {

  dsc_networkteam{ 'team1':
    dsc_ensure                 => 'present',
    dsc_name                   => 'team1',
    dsc_teammembers            => ['nic1','nic2'],
    dsc_teamingmode            => 'SwitchIndependent',
    dsc_loadbalancingalgorithm => 'Dynamic',
  }
}
