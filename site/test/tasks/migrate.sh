#!/bin/bash

set -e

declare PT_new_master

PUPPET_CONFDIR='/etc/puppetlabs/puppet'
PUPPET_BIN='/opt/puppetlabs/puppet/bin'
OLD_MASTER="${PUPPET_BIN} config print server"
DATE="$(date +%y%m%d%H%M%SZ)"

echo "==========================================="
echo "Backing up existing certificates and existing puppet.conf"
echo "==========================================="
tar czf ${PUPPET_CONFDIR}/sslbackup-${DATE}.tar.gz ${PUPPET_CONFDIR}/ssl
cp ${PUPPET_CONFDIR}/puppet.conf ${PUPPET_CONFDIR}/puppet.conf.bak-${DATE}
mv -f ${PUPPET_CONFDIR}/ssl /tmp/ssl-${DATE}

echo "==========================================="
echo "Setting noop and requesting new certificate from ${PT_new_master}"
echo "==========================================="
"${PUPPET_BIN}/puppet" config set noop true
"${PUPPET_BIN}/puppet" config set server ${PT_new_master}

if "${PUPPET_BIN}/puppet" agent -t
then
  echo "==========================================="
  echo "Certificate request successful, running puppet again in noop"
  echo "==========================================="
  "${PUPPET_BIN}/puppet" agent -t
else
  echo "==========================================="
  echo "The certificate couldn't be signed by ${PT_new_master}, reverting changes"
  echo "==========================================="
  mv ${PUPPET_CONFDIR}/puppet.conf.bak-${DATE} ${PUPPET_CONFDIR}/puppet.conf
  rm -rf ${PUPPET_CONFDIR}/ssl
  rm -rf ${PUPPET_CONFDIR}/sslbackup-${DATE}.tar.gz
  mv /tmp/ssl-${DATE} ${PUPPET_CONFDIR}/ssl
fi
