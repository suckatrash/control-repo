class test::network::windows_team::install_dsc_modules {

  pspackageprovider {'Nuget':
    ensure   => 'present',
    provider => 'windowspowershell',
    before   => Package['NetworkingDsc'],
  }

  package { 'NetworkingDsc':
    ensure   => latest,
    provider => 'windowspowershell',
    source   => 'PSGallery',
  }
}
