#!/bin/bash

# Fetch all JSON votes from strazha.bg.

url()
{
    echo "https://strazha-data2.eu-central-1.linodeobjects.com/sessions/$1/votes/$2.json"
}

output()
{
    echo "$1_$2.json"
}

main()
{
    # Loop over days.
    DAY=2021-12-03
    END=2022-07-30
    while [ "$DAY" != "$END" ]
    do
        # Loop over votes.
        for VOTE in $(seq 1 1024)
        do
            # Download data for every day/vote and store the HTTP code
            # returned into a variable.
            URL=$(url $DAY $VOTE)
            FILENAME=$(output $DAY $VOTE)
            HTTP_CODE=$(curl $URL --output "$FILENAME" --silent --write-out "%{http_code}")
            echo "$DAY/$VOTE: $HTTP_CODE"
            # If the returned code is !=200, break and move on to the
            # next day.
            if [ $HTTP_CODE -ne 200 ]
            then
                rm "$FILENAME"
                break
            fi
        done
        DAY=$(date -d "$DAY + 1day" -I)
    done
}

main
