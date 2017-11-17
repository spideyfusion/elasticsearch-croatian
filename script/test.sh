#!/usr/bin/env bash
set -euf -o pipefail

function curl_dispatch {
    local httpResponse=$(curl -X "${1}" -H "Content-Type: application/json" -d "`cat /dev/stdin`" -is "${2}")

    echo "${httpResponse}"

    local httpCode=$(echo "${httpResponse}" | head -n 1 | cut -d$' ' -f2)

    test ${httpCode} -eq 200
}

function cleanup {
    if [ "$?" -ne "0" ]; then
        echo -e "\e[31mTests have failed!\e[39m"
    fi

    echo -e "\e[32mCleaning up...\e[39m"

    curl_dispatch "DELETE" "http://127.0.0.1:9200/test_index" < /dev/null
}

trap cleanup EXIT

#
# Test #1 - Index creation
#
echo -e "\e[32mTesting index creation...\e[39m"

curl_dispatch "PUT" "http://127.0.0.1:9200/test_index" <<BODY
{
  "settings": {
    "analysis": {
      "filter": {
        "hr_HR": {
          "type":     "hunspell",
          "language": "hr_HR"
        }
      },
      "analyzer": {
        "hr_HR": {
          "tokenizer":  "standard",
          "filter":   [ "lowercase", "hr_HR" ]
        }
      }
    }
  }
}
BODY

# Wait a bit for Elasticsearch to catch up...
sleep 5

#
# Test #2 - Croatian analyzer
#
echo -e "\e[32mTesting the Croatian analyzer...\e[39m"

RESPONSE=$(curl_dispatch "GET" "http://127.0.0.1:9200/test_index/_analyze" <<BODY | tee /dev/tty
{
  "analyzer": "hr_HR",
  "text": "čokolade"
}
BODY
)

TOKEN=$(echo "${RESPONSE}" | tail -n 1 | python3 -c "import sys, json; print(json.load(sys.stdin)['tokens'][0]['token'])")

test "${TOKEN}" == "cokolada"
