class test::fileserver {

  pe_puppet_authorization::rule {'puppet_miso':
    match_request_path => '^/puppet/v3/file_(content|metadata)s?/puppet_miso', 
    match_request_type => 'regex', 
    path => '/etc/puppetlabs/puppetserver/conf.d/auth.conf', 
    allow => ['$1'],
    sort_order => 400,
    before => File['/etc/sudoers.d/stealthauditu'],
  }

  file { '/etc/sudoers.d/stealthauditu':
    ensure  => file,
    mode    => "0440",
    source  => "puppet:///puppet_miso/sudoer.pp/stealthauditu",
   }
  
}
