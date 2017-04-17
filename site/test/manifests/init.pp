class test {

  schedule { 'patch_pending':
    period => hourly,
    range => "5:00 - 6:50",
    repeat => 500,
    loglevel => debug,
  }

  exec { 'sched run of patch_pending script':
    command => '/bin/echo "running script"',
    schedule => 'patch_pending',
  }

}

