class role::postgres {

    pe_postgresql::server::config_entry {'auto_explain.log_min_duration':
      value => String(20001),
    }

    pe_postgresql::server::config_entry {'auto_explain.log_analyze':
      value => "true",
    }
}
