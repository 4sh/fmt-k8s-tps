#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Verify if CA cert is present
if [[ -f $DIR/CA/ca.crt && -f  $DIR/CA/ca.key ]]
then
    echo "CA Certs detected"
    # Generate private key and CSR
    openssl req -new -newkey rsa:2048 -nodes \
     -keyout $DIR/generated-certs/private.key \
     -out $DIR/generated-certs/certificate.csr \
     -config $DIR/openssl.conf

    # Sign the CSR with the CA to create the certificate
    openssl x509 -req -in $DIR/generated-certs/certificate.csr \
     -CA $DIR/CA/ca.crt -CAkey $DIR/CA/ca.key -CAcreateserial \
     -out $DIR/generated-certs/certificate.crt -days 3650 \
     -extensions 'v3_ca' -extfile $DIR/openssl.conf
else
    echo "CA certs not found, please create CA certs first"
fi