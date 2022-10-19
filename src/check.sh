#!/bin/bash
set -e

if [[ -z $DDNS_RECORDS ]]; then
  echo 'DDNS_RECORDS not set!'
  exit 1
fi

if [[ -z $DOMAIN ]]; then
  echo "DOMAIN not set!"
  exit 1
fi

read -ra ddns_records <<< "$DDNS_RECORDS"
export ddns_records
for ddns_record in "${ddns_records[@]}"; do
  record_type=${ddns_record#*:}
  if [[ $record_type == "A" ]]; then
    export HAS_IPV4=1
  elif [[ $record_type == "AAAA" ]]; then
    export HAS_IPV6=1
  else
    echo "Unknown record type $record_type!"
    exit 1
  fi
done

