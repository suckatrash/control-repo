class test::type {

java_ks { 'wls_identity:truststore_wls': 
  ensure => latest, 
  certificate => "/tmp/local/localhost.crt", 
  target => "/tmp/local/schufa_trust.jks", 
  password => "password", 
  trustcacerts => true, 
}

}