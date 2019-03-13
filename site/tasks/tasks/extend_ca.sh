#!/bin/bash

set -e

PUPPET_BIN='/opt/puppetlabs/puppet/bin'

ca_cert=$("${PUPPET_BIN}/puppet" config print --section master cacert)
ca_key=$("${PUPPET_BIN}/puppet" config print --section master cakey)
ca_dir=$(dirname "${ca_cert}")

# Compute start and end dates for new certificate.
# Formats the year as YY instead of YYYY because the latter isn't supported
# until OpenSSL 1.1.1.
start_date=$(date -u --date='-24 hours' '+%y%m%d%H%M%SZ')
end_date=$(date -u --date='+5475 days' '+%y%m%d%H%M%SZ')
ca_serial_num=$("${PUPPET_BIN}/openssl" x509 -in "${ca_cert}" -noout -serial|cut -d= -f2)

# Build a temporary directory with files required to renew the CA cert.
workdir=$(mktemp -d -t renew_ca_cert.XXX)
printf '%s' "${ca_serial_num}" > "${workdir}/serial"
touch "${workdir}/inventory"
touch "${workdir}/inventory.attr"

cat <<EOT > "${workdir}/openssl.cnf"
[ca]
default_ca=ca_settings

[ca_settings]
serial=${workdir}/serial
new_certs_dir=${workdir}
database=${workdir}/inventory
default_md=sha256
policy=ca_policy
x509_extensions=cert_extensions

[ca_policy]
commonName=supplied

[cert_extensions]
basicConstraints=critical,CA:TRUE
keyUsage=keyCertSign,cRLSign
subjectKeyIdentifier=hash
authorityKeyIdentifier=issuer:always
EOT

# Generate a signing request from the existing certificate
"${PUPPET_BIN}/openssl" x509 -x509toreq \
  -in "${ca_cert}" \
  -signkey "${ca_key}" \
  -out "${workdir}/ca_csr.pem"

# Sign the request
new_ca_cert="${ca_dir}/ca_crt-expires-${end_date}.pem"

yes | "${PUPPET_BIN}/openssl" ca \
  -in "${workdir}/ca_csr.pem" \
  -keyfile "${ca_key}" \
  -config "${workdir}/openssl.cnf" \
  -selfsign \
  -startdate "${start_date}" \
  -enddate "${end_date}" \
  -out "${new_ca_cert}" >&2

printf '\nRenewed CA certificate created\n' >&2
printf '%s\n' "${new_ca_cert}"
