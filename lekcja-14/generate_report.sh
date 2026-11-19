#!/bin/bash
set -euo pipefail

CSV_FILES=(results-*.csv)

if [[ ${#CSV_FILES[@]} -ne 3 ]]; then
    echo "Error: expected exactly 3 CSV files."
    exit 1
fi

# Calculate the median of three values.
median() {
    printf '%s\n' "$@" | sort -n | sed -n '2p'
}

# Create the report file.
echo "# Server Performance Report" > raport.md

# Write median results for each concurrency level.
for concurrency in 10 25 50 100 200 400; do
    echo "" >> raport.md
    echo "## Concurrency: $concurrency" >> raport.md

    for column in 3 4 5 6 7 8 9; do
        values=()

        for file in "${CSV_FILES[@]}"; do
            value=$(awk -F',' -v c="$concurrency" -v col="$column" \
                'NR > 1 && $1 == c {print $col}' "$file")
            values+=("$value")
        done

        result=$(median "${values[@]}")

        case "$column" in
            3) label="Time (seconds)" ;;
            4) label="Requests per second (RPS)" ;;
            5) label="p50 latency (ms)" ;;
            6) label="p95 latency (ms)" ;;
            7) label="p99 latency (ms)" ;;
            8) label="Failed requests" ;;
            9) label="Non-2xx responses" ;;
        esac

        echo "- $label median: $result" >> raport.md
    done
done

# Add information about the test environment.
{
    echo ""
    echo "## Environment"
    echo ""
    echo "- Nginx version: $(nginx -v 2>&1)"
    echo "- Apache Bench version: $(ab -V 2>&1 | head -n 1)"
    echo "- CPU cores: $(nproc)"
    echo ""
    echo "### Memory"
    echo ""
    echo '```'
    free -h
    echo '```'
    echo ""
    echo "### Connection"
    echo ""
    echo "- Load generator (Apache Bench) and server (Nginx) run on the same Linux host."
    echo "- Host IP: 192.168.1.20"
    echo "- Requests are sent to http://localhost/ over the loopback interface."
} >> raport.md

echo "Report generated: raport.md"
