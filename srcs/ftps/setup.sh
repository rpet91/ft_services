#!/bin/sh
# Point to the internal API server hostname
APISERVER=https://kubernetes.default.svc

# Path to ServiceAccount token
SERVICEACCOUNT=/var/run/secrets/kubernetes.io/serviceaccount

# Read the ServiceAccount bearer token
TOKEN=$(cat ${SERVICEACCOUNT}/token)

# Reference the internal certificate authority (CA)
CACERT=${SERVICEACCOUNT}/ca.crt

# Explore the API with TOKEN
URL=$(curl --cacert ${CACERT} --header "Authorization: Bearer ${TOKEN}" -X GET ${APISERVER}/api/v1/namespaces/default/services/ftps/ 2>/dev/null| jq -r '.status | .loadBalancer | .ingress | .[] | .ip')

echo "pasv_address=$URL" >> etc/vsftpd/vsftpd.conf

vsftpd etc/vsftpd/vsftpd.conf
