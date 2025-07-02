#!/bin/bash

run=$(python3 script/mainOrg.py -d cat.com)
domain=$(echo $run | cut -d ' ' -f 1 | cut -d '.' -f 1)
org=$(echo $run | cut -d ':' -f 2)
echo Testing: $org

python3 script/search.py -d "$domain" -o "$org"
