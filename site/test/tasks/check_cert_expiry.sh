#!/bin/bash

# shellcheck disable=SC2230

declare PT_certificate

if [ -e "$PT_certificate" ]
then
  DATE="$(openssl x509 -in $PT_certificate -noout -text | grep "Not After" | awk '{print $4 " " $5 " " $6 " " $7}')"
  echo "$PT_certificate expires on $DATE"
else
  echo "$PT_certificate is not present on this host"
  exit 1
fi
