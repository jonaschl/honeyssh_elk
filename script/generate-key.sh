#!/bin/bash
read -e -r -p  "Please type in a storgae location for the keys: " ort_keystore
if [[ ! -d "$ort_keystore" ]]; then
  echo "The storage location is not valid!"
  echo "Exit!"
  exit 1
fi

read -e -r -p  "Please type in a name for the key: " logstash_key

(cd "$ort_keystore" || exit 1
openssl genrsa -out "$logstash_key-key.pem" 4096
echo ""
echo "Generating the Certificate Signing Request"
echo "Be carefull the 'Common Name' have to be identically to the address you use for Curl"
echo "For example:"
echo "If the adress is https://127.0.0.1:8001 the'Common Name' have to be '127.0.0.1'"
echo ""
openssl req -new -key "$logstash_key-key.pem" -out "$logstash_key-request.csr" -sha512
)
echo "Key and Request were successfully generated"
echo ""
echo "Start Sign process through the CA"

read -e -r -p  "Please type in the storage location for the private CA key: " ca_key

if [[ ! -f "$ca_key" ]]; then
  echo "The storage location is not valid!"
  echo "Exit!"
  exit 1
fi

read -e -r -p  "Please type in the storage location of the CA certificate: " ca_cert

if [[ ! -f "$ca_cert" ]]; then
  echo "The storage location is not valid!"
  echo "Exit!"
  exit 1
fi

(cd "$ort_keystore" || exit 1
openssl x509 -req -in "$logstash_key-request.csr" -CA "$ca_cert" -CAkey "$ca_key" -CAcreateserial -out "$logstash_key-pub.pem" -days 365 -sha512
)

echo "The sign process is finished"
echo ""
echo "Creating the key store"
echo "Be carefull: You have to type in a passwort or the process will break"


(cd "$ort_keystore" || exit 1
echo "Creating a temporary key"
openssl pkcs12 -export -in "$logstash_key-pub.pem" -inkey "$logstash_key-key.pem" -out "tmp.p12"
echo "Creating the Java keystore"
keytool -importkeystore -destkeystore "$logstash_key.keystore" -srckeystore "tmp.p12" -srcstoretype PKCS12
)
echo "Creation of the keystore finished"
echo ""
echo "Cleanup"

(cd "$ort_keystore" || exit 1
rm -f "tmp.p12"
rm -f "$logstash_key-request.csr"
)
