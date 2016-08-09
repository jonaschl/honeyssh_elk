curl -XPUT 'https://bree:31313' --verbose  --cacert /opt/honeyssh_elk/certificates/root-pub.pem -u user:pass -d '
{"openssh-version": "0", "session-id": "112570", "duration": 1, "id": "109429", "ip-adress": "185.58.227.51", "start-time": "2016-04-05 08:11:52", "protocol-version": "2", "end-time": "2016-04-05 08:11:53", "banner": "SSH-2.0-libssh-0.1", "cipher-in": "aes256-cbc", "cipher-out": "aes256-cbc", "potmode": "1"}
{"potmode": "1", "session-id": "73248", "duration": 3, "cipher-in": "aes256-ctr", "sensor-id": "Albus", "banner": "SSH-2.0-libssh-0.5.2", "end-time": "2016-04-12 06:10:17", "ip-adress": "112.33.3.69", "protocol-version": "2", "cipher-out": "aes256-ctr", "start-time": "2016-04-12 06:10:14", "openssh-version": "0", "id": "70107"}
' 
