class test::type {

java_ks { 'test': 
  ensure => latest, 
  certificate => "/tmp/local/localhost.crt", 
  target => "/tmp/local/schufa_trust.jks", 
  password => "password", 
  trustcacerts => true, 
}

}
