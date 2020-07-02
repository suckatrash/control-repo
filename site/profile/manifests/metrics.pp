class profile::metrics {

  puppet_metrics_dashboard::profile::compiler{ $facts['networking']['fqdn']:
    timeout => '5s',
  }

  puppet_metrics_dashboard::profile::puppetdb{ $facts['networking']['fqdn']:
    timeout          => '5s',
    #puppetdb_metrics => lookup(puppet_metrics_dashboard::profile::puppetdb::puppetdb_metrics)
  }

  include puppet_metrics_dashboard::profile::master::postgres_access

}
