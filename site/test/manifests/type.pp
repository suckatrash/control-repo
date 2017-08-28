class test::type {

java_ks { 'wls-identity-truststore-wls': 
  ensure => latest, 
  certificate => "/tmp/local/localhost.crt", 
  target => "/tmp/local/schufa_trust.jks", 
  password => "password", 
  trustcacerts => true, 
}

}
