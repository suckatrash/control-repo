class test::rundir {

  notify {"rundir: ${settings::rundir}":}
  notify {"certname: ${::settings::certname}":}
  notify {"storeconfigs_backend: ${::settings::storeconfigs_backend}":}

}
