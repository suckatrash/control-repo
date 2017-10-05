class test::t26999 {

java_ks { 'wls_identity:truststore_wls': 
  ensure => latest, 
  certificate => "$/tmp/local/localhost.crt", 
  target => "/tmp/local/schufa_trust.jks", 
  password => "password", 
  trustcacerts => true, 
}

}
