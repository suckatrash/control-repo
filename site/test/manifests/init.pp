class test {

  schedule { 'patch_pending2':
    period => hourly,
    range => "5:00 - 6:50",
    repeat => 500,
    loglevel => verbose,
  }

  exec { 'sched run of patch_pending script':
    command => '/bin/echo "running script"',
    schedule => 'patch_pending2',
    loglevel => verbose,
  }

}

