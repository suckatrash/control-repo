--- 
puppet_enterprise::master::puppetserver::jruby_max_active_instances: 7 
puppet_enterprise::profile::master::java_args: 
  "Xmx": "4096m" 
  "Xms": "4096m" 

message: "This node is using common data"

#Puppet Server Tuning 
puppet_enterprise::master::puppetserver::jruby_max_requests_per_instance: 10000 
#puppet_enterprise::profile::console::classifier_synchronization_period: 120

#------------------------------------------------------------------------------------------ 
#class dnsclient 
#------------------------------------------------------------------------------------------ 
dnsclient::nameservers: 
  - x.x.x.x 
  - x.x.x.x 
dnsclient::search: 
  - domain1 
  - domain2 
  - domain3 
dnsclient::options: 'UNSET' 
dnsclient::test_variable_kenny: '#common data' 
#------------------------------------------------------------------------------------------ 
#class ntp 
#------------------------------------------------------------------------------------------ 
ntp::servers: 
  - mail.here.now 
ntp::service_manage: true 
ntp::package_manage: true

#------------------------------------------------------------------------------------------ 
#class snmp 
#------------------------------------------------------------------------------------------ 
snmp::contact: 'System Administrator' 
snmp::location: 'B856 Rm108 Rack br549' 
snmp::ro_community: 'something crazy' 
snmp::snmpd_config: 
  - 'extend datecheck /bin/date' 
  - 'extend .1.3.6.1.4.1.9999.400 SYSTEM_DATE /bin/date' 
  - '#extend flimflam /roothome/temperature.sh' 
  - 'extend uptime /usr/bin/uptime'

# 
#class sendmail 
# 

sendmail::relay_server: relay.mail.here.now

# 
# class accounts 
#

# Theses are the core groups for all sudo 
sudo::sudo_core_groups: 
  - g1 
  - g2 
  - g3 
sudo::sudo_snowflake_groups:
