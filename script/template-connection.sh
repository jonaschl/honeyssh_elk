curl -XPUT localhost:9200/_template/connectionhoneyssh_1 -d '
{
  "template": "connectionhoneyssh*",
  "settings": {
    "number_of_shards": 5
  },
  "mappings": {
    "session": {
      "properties": {
        "@timestamp": {
          "type": "date",
          "format": "strict_date_optional_time||epoch_millis"
        },
        "@version": {
          "type": "string"
        },
        "banner": {
          "type": "string",
          "index": "not_analyzed"
        },
	"sensor-id": {
          "type": "string",
          "index": "not_analyzed"
        },
	"cipher-in": {
          "type": "string",
          "index": "not_analyzed"
        },
        "cipher-out": {
          "type": "string",
          "index": "not_analyzed"
        },
        "duration": {
          "type": "long"
        },
        "end-time": {
          "type": "date",
          "format": "yyyy-MM-dd HH:mm:ss"
        },
        "geoip": {
          "properties": {
            "area_code": {
              "type": "long"
            },
            "city_name": {
              "type": "string",
              "index": "not_analyzed"
            },
            "continent_code": {
             "type": "string",
              "index": "not_analyzed"
            },
            "coordinates": {
              "type": "geo_point"
            },
            "country_code2": {
              "type": "string",
              "index": "not_analyzed"
            },
            "country_code3": {
              "type": "string",
              "index": "not_analyzed"
            },
            "country_name": {
              "type": "string",
              "index": "not_analyzed"
            },
            "dma_code": {
              "type": "long"
            },
            "ip": {
              "type": "ip"
            },
            "latitude": {
              "type": "double"
            },
            "location": {
              "type": "geo_point"
            },
            "longitude": {
              "type": "double"
            },
            "postal_code": {
              "type": "string",
              "index": "not_analyzed"
            },
            "real_region_name": {
              "type": "string",
              "index": "not_analyzed"
            },
            "region_name": {
              "type": "string",
              "index": "not_analyzed"
            },
            "timezone": {
              "type": "string",
              "index": "not_analyzed"
            }
          }
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
        "ip-adress": {
          "type": "ip"
        },
        "openssh-version": {
          "type": "long"
        },
        "potmode": {
          "type": "long"
        },
        "protocol-version": {
          "type": "long"
        },
        "session-id": {
          "type": "long"
        },
        "start-time": {
          "type": "date",
          "format": "yyyy-MM-dd HH:mm:ss"
        }
      }
    }
  }
}
'
