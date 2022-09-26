#!/bin/bash

fetch()
{
    DATE=$1
    OUTPUT="$DATE.json"
    HTTP_CODE=$(
        curl \
            "https://strazha-data2.eu-central-1.linodeobjects.com/sessions/$DATE/index.json" \
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
            --output "$OUTPUT" \
            --silent \
            --write-out "%{http_code}"
    )
    echo "$OUTPUT: $HTTP_CODE"
    if [ $HTTP_CODE -ne 200 ]
    then
        rm $OUTPUT
    fi
}

main()
{
    DAY=2021-12-03
    END=2022-07-30
    while [ "$DAY" != "$END" ]
    do
        fetch $DAY
        DAY=$(date -d "$DAY + 1day" -I)
    done
}

main
