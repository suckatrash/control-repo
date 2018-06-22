#!/bin/bash

if [ -e /opt/puppetlabs/puppet/cache/state/agent_disabled.lock ] 
then
  echo "Puppet agent is disabled"
else
  echo "Puppet agent is enabled"
  exit 1
fi
