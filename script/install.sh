#!/bin/bash


if [[ ! -d /opt/logstash/keystore ]]; then
  echo "Create directory for the keys"
  mkdir -p /opt/logstash/keystore
fi


getent group "logstash" >/dev/null || echo "Create group logstash" & groupadd  "logstash"
getent passwd "logstash" >/dev/null || \
echo "Create user logstash" &  useradd --system --no-create-home -g logstash "logstash"

echo "Install systemd service files"
cp -f ../systemd/logstash-connection.service /lib/systemd/system/logstash-connection.service
cp -f ../systemd/logstash-login.service /lib/systemd/system/logstash-login.service
systemctl daemon-reload

if [[ ! -d /opt/logstash/configuration ]]; then
  echo "Create directory for the logstash configuration files"
  mkdir -p /opt/logstash/configuration
fi

if [[ ! -d /opt/logstash/logs/ ]]; then
  echo "Create directory for the logstash log files"
  mkdir -p /opt/logstash/logs/
fi

if [[ ! -d /opt/honeyssh_elk/certificates ]]; then
  echo "Create directory for the certificates"
  mkdir -p /opt/honeyssh_elk/certificates
fi


echo "Install logstash configuration files"
cp -f ../logstash_conf/logstash-connection.conf  /opt/logstash/configuration/logstash-connection.conf
cp -f ../logstash_conf/logstash-login.conf  /opt/logstash/configuration/logstash-login.conf

echo "Install nginx configuration file"
cp -f ../nginx/kibana.conf /etc/nginx/conf.d/kibana.conf


echo "Set permissions"

chown -R logstash:logstash /opt/logstash/configuration/
chown -R logstash:logstash /opt/logstash/keystore
chown -R logstash:logstash /opt/logstash/logs/

echo "Everything is done"
echo "Before you start the logstash instances genereate the keystore"
echo "Use the generate-key.sh script"
