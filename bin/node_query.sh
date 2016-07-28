#!/bin/bash

PATH="/opt/puppetlabs/bin:/opt/puppetlabs/puppet/bin:/opt/puppet/bin:$PATH"

declare -x PE_CERT=$(puppet agent --configprint hostcert)
declare -x PE_KEY=$(puppet agent --configprint hostprivkey)
declare -x PE_CA=$(puppet agent --configprint localcacert)

declare -x NC_CURL_OPT="-s --cacert $PE_CA --cert $PE_CERT --key $PE_KEY --insecure"

show_node()
{
  curl $NC_CURL_OPT --insecure https://master.inf.puppet.vm:8140/puppet/v3/node/$1?environment=production | python -m json.tool
}

if [ "$1" == "" ]; then
  echo "This tool requires an fqdn as input"
else
  show_node $1
fi
