class test {

  schedule { 'patch_pending':
    period => daily,
    range => "5:00 - 23:55",
    repeat => 500,
  }

  exec { 'sched run of patch_pending script':
    command => '/bin/echo "running script"',
    schedule => 'patch_pending',
  }

}

