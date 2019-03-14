#!/bin/bash

set -e

declare PT_new_master

PUPPET_CONFDIR='/etc/puppetlabs/puppet'
PUPPET_BIN='/opt/puppetlabs/puppet/bin'
OLD_MASTER="${PUPPET_BIN} config print server"

echo "Backing up existing certificates"
tar czvf ${PUPPET_CONFDIR}sslbackup-$(date +%y%m%d%H%M%SZ).tar.gz ${PUPPET_CONFDIR}
mv ${PUPPET_CONFDIR}/ssl /tmp

echo "Setting noop and requesting new certificate from ${PT_new_master}"
"${PUPPET_BIN}/puppet" config set noop=true
"${PUPPET_BIN}/puppet" config set server=${PT_new_master}
"${PUPPET_BIN}/puppet" agent -t
