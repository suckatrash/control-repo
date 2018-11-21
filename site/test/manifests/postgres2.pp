class test::postgres2 (
   $pg_ident_conf_path            = "/opt/puppetlabs/server/data/postgres/9.6/data/pg_ident.conf
   $ip_mask_allow_all_users_ssl   = '0.0.0.0/0',
   $ipv6_mask_allow_all_users_ssl = '::/0',
   $grafana_hostname
){

        puppet_enterprise::pg::cert_whitelist_entry { "Allow telegraf user to connect to pe-puppetdb as telegraf}":
            user                          => "telegraf",
            database                      => "pe-puppetdb",
            allowed_client_certname       => $grafana_hostname,
            pg_ident_conf_path            => $pg_ident_conf_path,
            ip_mask_allow_all_users_ssl   => $ip_mask_allow_all_users_ssl,
            ipv6_mask_allow_all_users_ssl => $ipv6_mask_allow_all_users_ssl,
        }
        
}
