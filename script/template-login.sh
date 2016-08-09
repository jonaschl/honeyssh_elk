curl -XPUT localhost:9200/_template/loginhoneyssh_1 -d '
{
  "template": "loginhoneyssh*",
  "settings": {
    "number_of_shards": 5
  },
  "mappings": {
    "login": {
      "properties": {
          "@timestamp": {
            "type": "date",
            "format": "strict_date_optional_time||epoch_millis"
          },
          "@version": {
            "type": "string"
          },
        "headers": {
          "properties": {
            "content_length": {
              "type": "string",
              "index": "not_analyzed"
            },
            "content_type": {
              "type": "string",
              "index": "not_analyzed"
            },
            "http_accept": {
              "type": "string",
              "index": "not_analyzed"
            },
            "http_authorization": {
              "type": "string",
              "index": "not_analyzed"
            },
            "http_host": {
              "type": "string",
              "index": "not_analyzed"
            },
            "http_user_agent": {
              "type": "string",
              "index": "not_analyzed"
            },
            "http_version": {
              "type": "string",
              "index": "not_analyzed"
            },
            "remote_user": {
              "type": "string",
              "index": "not_analyzed"
            },
            "request_method": {
              "type": "string",
              "index": "not_analyzed"
            },
            "request_path": {
              "type": "string",
              "index": "not_analyzed"
            },
            "request_uri": {
              "type": "string",
              "index": "not_analyzed"
            }
          }
        },
        "host": {
          "type": "string",
          "index": "not_analyzed"
        },
        "id": {
            "type": "long"
            
          },
          "number": {
            "type": "long"
            
          },
          "password": {
            "type": "string",
            "index": "not_analyzed"
          },
          "session-id": {
            "type": "long"
          },
          "time": {
          "type": "date",
          "format": "yyyy-MM-dd HH:mm:ss"
          },
          "username": {
            "type": "string",
            "index": "not_analyzed"
          }
      }
    }
  }
}
'
