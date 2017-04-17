class test {

  schedule { 'patch_pending':
    period => hourly,
    range => "5:00 - 23:50",
    repeat => 500,
    #loglevel => err,
  }

  exec { 'sched run of patch_pending script':
    command => '/bin/echo "running script"',
    schedule => 'patch_pending',
  }

}

