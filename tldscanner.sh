#!/bin/bash

# Default values
directory=""
output=""

# Parse options
while getopts "d:o:h" opt; do
  case $opt in
    d)
      directory="$OPTARG"
      ;;
    o)
      output="$OPTARG"
      ;;
    h)
      echo "Usage: $0 -d <directory> [-o <output_file>] [-h]"
      echo
      echo "Options:"
      echo "  -d <directory>     Directory to scan"
      echo "  -o <output_file>   Optional output file"
      echo "  -h                 Show this help message"
      exit 0
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      echo "Use -h for help"
      exit 1
      ;;
  esac
done

run=$(python3 script/mainOrg.py -d "$directory")
domain=$(echo $run | cut -d ' ' -f 1 | cut -d '.' -f 1)
org=$(echo $run | cut -d ':' -f 2)
echo Testing: $org

if [[ -n "$output" ]]; then
    python3 script/search.py -d "$domain" -o "$org" > $output
else:
    python3 script/search.py -d "$domain" -o "$org"
fi
