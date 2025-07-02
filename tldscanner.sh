#!/bin/bash

# Default values
directory=""
output=""

# Parse options
while getopts "d:o:" opt; do
  case $opt in
    d)
      directory="$OPTARG"
      ;;
    o)
      output="$OPTARG"
      ;;
    \?)
      echo "Usage: $0 -d <directory> -o <output_file>"
      exit 1
      ;;
  esac
done


run=$(python3 script/mainOrg.py -d "$directory")
domain=$(echo $run | cut -d ' ' -f 1 | cut -d '.' -f 1)
org=$(echo $run | cut -d ':' -f 2)
echo Testing: $org

python3 script/search.py -d "$domain" -o "$org"
