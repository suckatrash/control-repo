class profile::accounts {

Accounts::User {
  key => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDQ8R99PTXMfaIadMWOnbJm1EQ43uyQAcFcCXe1bWLfxE4VfWy66Vx8ZYp5DXKgAkmbGKN8Ce98bElpXJsq4RBJraGiiPSHgw92y8AWPyPWuAB/N3KydHS/R2nnr7rqxRUOCmqhC51NqJqCEu6RWa1X88uzREoHD+4J16BgSaIh4GFZy/xRcLkQ1eJCUy4XZOvmLCrn5da6Z1Fd/k2lphVQ7QR+NkBXUnmwcXtcGP4m7dqFRBHqWMUPItLJhW3Pm9tmlNuxOE4MJMvtam4ppE5pzwD1R64+lsFodfgj4JtnyJb9u6t9A5O96MoZkdqYbA8v0a+yPgFolYqyoHutAQWax2mfdwiA4HgvkfVvp9hEQpTdbRwuIlrEA0+YIqQi2MH3m5fuNXY8YPEmEXY9qbdaad07k8aAYT7hJHOLCe8qAv9eM9Xt+eVWQVo/OkPLDX11v/CUpwlPNoAyMyKru2yTf8tdoqyXBNQyIsgZSTZN4fdRin4KtxScsljp1XbT3qDgmknKDdp4/77erg4ARUNTbmMFzLcDDzYDaLRtbmVnyJQLWc0PWYpDrbzFHdW1LCA/sK/AJRMyZaJ9iX/c5/DMgQbN/ORYdbnCt76kEiSoh+qfPqFf1krU8uBDSUOOzEHeYglqNt3bzJK5HkzHp/Rgrj+AGK0y4ixmzhfl4pnXYw==',
}

ssh_authorized_key { 'root':
  ensure => present,
  user   => 'root',
  type   => 'ssh-rsa',
  key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCe/4aXayUh9xwDPTrm5v9/eJcnuml4bLjOMWiqq+4Qt20Q/Qpowtga+KxQ8nXruWfKpF53C0y6DDaB5yo94Vfa2snz6VWpTgESUyFXobeqLV1QabDPbWLQgWL1N0xryYb1rwVlwBmAdT1MAkTGzZfgAvmctnh7Ssi4nOwJn8J0KZ9D3e0P6N03FltdECkSrMU6H5kEFRAtOcvv1CcX5mCVyKsVGtt0qf8arRB4ANbiE4JNDvlKcCtaFSo8DYisSMtb1BUT8V0AXZno4OALea9cyP+YYi8sXzhihZFdmFOVNPUWNhXRZGDkHaSC/P6iDrnG1LjcvhtD3YKyzzRE2bHl',
}

accounts::user{ 'root':
  email => 'erik.hansen@puppet.com',
}

}
