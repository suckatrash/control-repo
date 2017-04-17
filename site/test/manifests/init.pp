class test {

  schedule { 'patch_pending':
    period => daily,
    range => "5:00 - 6:00",
    repeat => 500,
    lovlevel => err,
  }

  exec { 'sched run of patch_pending script':
    command => '/bin/echo "running script"',
    schedule => 'patch_pending',
  }

}

