class profile::accounts {

Accounts::User {
  key => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDQ8R99PTXMfaIadMWOnbJm1EQ43uyQAcFcCXe1bWLfxE4VfWy66Vx8ZYp5DXKgAkmbGKN8Ce98bElpXJsq4RBJraGiiPSHgw92y8AWPyPWuAB/N3KydHS/R2nnr7rqxRUOCmqhC51NqJqCEu6RWa1X88uzREoHD+4J16BgSaIh4GFZy/xRcLkQ1eJCUy4XZOvmLCrn5da6Z1Fd/k2lphVQ7QR+NkBXUnmwcXtcGP4m7dqFRBHqWMUPItLJhW3Pm9tmlNuxOE4MJMvtam4ppE5pzwD1R64+lsFodfgj4JtnyJb9u6t9A5O96MoZkdqYbA8v0a+yPgFolYqyoHutAQWax2mfdwiA4HgvkfVvp9hEQpTdbRwuIlrEA0+YIqQi2MH3m5fuNXY8YPEmEXY9qbdaad07k8aAYT7hJHOLCe8qAv9eM9Xt+eVWQVo/OkPLDX11v/CUpwlPNoAyMyKru2yTf8tdoqyXBNQyIsgZSTZN4fdRin4KtxScsljp1XbT3qDgmknKDdp4/77erg4ARUNTbmMFzLcDDzYDaLRtbmVnyJQLWc0PWYpDrbzFHdW1LCA/sK/AJRMyZaJ9iX/c5/DMgQbN/ORYdbnCt76kEiSoh+qfPqFf1krU8uBDSUOOzEHeYglqNt3bzJK5HkzHp/Rgrj+AGK0y4ixmzhfl4pnXYw==',
}

sudo::conf { 'erik':
  priority => 60,
  content  => "erik ALL=(ALL) NOPASSWD: ALL",
}

accounts::user{ 'erik':
  email => 'erik@iamusingtheinternet.com',
}

}
