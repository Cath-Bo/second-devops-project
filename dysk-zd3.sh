#!/bin/bash

# 1. Default values
threshold=85
verbose=false
threshold_source="default"
verbose_source="default"

# 2. Config file
config_file="$HOME/.config/dysk.conf"

if [[ -f "$config_file" ]]; then
    while IFS='=' read -r key value; do
        case "$key" in
            threshold)
                threshold="$value"
                threshold_source="file"
                ;;
            verbose)
                verbose="$value"
                verbose_source="file"
                ;;
            ""|\#*) ;;
            *)
                echo "WARNING: Unknown key: $key" >&2
                ;;
        esac
    done < "$config_file"
fi

# 3. Environment variables
if [[ -n "$DISK_THRESHOLD" ]]; then
    threshold="$DISK_THRESHOLD"
    threshold_source="environment"
fi

if [[ -n "$DISK_VERBOSE" ]]; then
    verbose="$DISK_VERBOSE"
    verbose_source="environment"
fi

# 4. Command-line options
while [[ $# -gt 0 ]]; do
    case "$1" in
        -p)
            threshold="$2"
            threshold_source="command line"
            shift 2
            ;;
        -v)
            verbose=true
            verbose_source="command line"
            shift
            ;;
        -h)
            echo "Usage: $0 [-p PROCENT] [-v] [-h] [--pokaz-konfiguracje]"
            exit 0
            ;;
        --pokaz-konfiguracje)
            show_config=true
            shift
            ;;
        *)
            echo "Unknown option: $1" >&2
            exit 1
            ;;
    esac
done

# Show configuration
if [[ "$show_config" == true ]]; then
    echo "threshold=$threshold ($threshold_source)"
    echo "verbose=$verbose ($verbose_source)"
    exit 0
fi

# Check disks
exit_code=0

while read -r filesystem usage; do
    usage="${usage%\%}"

    if (( usage > threshold )); then
        message="WARNING: $filesystem is ${usage}% full"
        echo "$message" >> dysk.log

        if [[ "$verbose" == true ]]; then
            echo "$message"
        fi

        exit_code=1
    fi
done < <(df -P | awk 'NR > 1 {print $1, $5}')

exit "$exit_code"
