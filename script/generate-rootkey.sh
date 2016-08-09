#!/bin/bash
read -e -r -p  "Please type in a storage location for the root key: " storage_keystore
if [[ ! -d "$storage_keystore" ]]; then
  echo "The storage location is not valid!"
  echo "Exit!"
  exit 1
fi

read -e -r -p  "Please type in a name for the root key: " root_key

(cd "$storage_keystore" || exit 1
echo ""
echo "Generating the root key"
openssl genrsa -out "$root_key-key.key" 4096
echo ""
echo "Generating the root Certificate"
openssl req -x509 -new -nodes -key "$root_key-key.key" -sha256 -days 1024 -out "$root_key-pub.pem"
)
echo ""
echo "Everything is done"
