#!/bin/bash

curl \
    'https://strazha-data2.eu-central-1.linodeobjects.com/parliaments/47/index.json' \
    -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:105.0) Gecko/20100101 Firefox/105.0' \
    -H 'Accept: application/json, text/plain, */*' \
    -H 'Accept-Language: en-US,en;q=0.5' \
    -H 'Accept-Encoding: gzip, deflate, br' \
    -H 'Origin: https://www.strazha.bg' \
    -H 'DNT: 1' \
    -H 'Connection: keep-alive' \
    -H 'Referer: https://www.strazha.bg/' \
    -H 'Sec-Fetch-Dest: empty' \
    -H 'Sec-Fetch-Mode: cors' \
    -H 'Sec-Fetch-Site: cross-site' \
    -H 'Sec-GPC: 1' \
    -H 'Pragma: no-cache' \
    -H 'Cache-Control: no-cache' \
    --output parliament47x.json
# jq <parliament47x.json
