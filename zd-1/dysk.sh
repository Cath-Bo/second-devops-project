#!/bin/bash

threshold=85
verbose=false
log_file="dysk.log"

while getopts "p:vh" opt; do
    case "$opt" in
        p) threshold="$OPTARG" ;;
        v) verbose=true ;;
        h)
            echo "Usage: $0 [-p PROCENT] [-v] [-h]"
            exit 0
            ;;
        *)
            exit 1
            ;;
    esac
done

exit_code=0

while read -r filesystem usage; do
    usage="${usage%\%}"

    if (( usage >= threshold )); then
        message="WARNING: $filesystem is ${usage}% full"
        echo "$message" >> "$log_file"
        $verbose && echo "$message"
        exit_code=1
    fi
done < <(df -P | awk 'NR > 1 {print $1, $5}')

exit "$exit_code"
