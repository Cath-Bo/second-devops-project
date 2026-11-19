#!/bin/bash
# Measures server performance at increasing concurrency levels.
set -uo pipefail

URL="${1:-http://localhost/}" # Set the target server URL (default: localhost).
REQUESTS="${2:-2000}" # Set the number of requests per test (default: 2000).
LEVELS=(10 25 50 100 200 400) # Define concurrency levels for testing.

TIMESTAMP=$(date +%Y%m%d-%H%M%S) # Generate a timestamp for unique filenames.
CSV="results-${TIMESTAMP}.csv" # Set the CSV output filename.
RAW_DIR="raw-${TIMESTAMP}" # Set the directory for raw test outputs.

# Check that Apache Bench is installed.
command -v ab >/dev/null || {
    echo "Error: ab is not installed. Install apache2-utils." >&2
    exit 1
}

# Create a directory for raw test outputs.
mkdir -p "$RAW_DIR"

# Create CSV file with column headers
echo "concurrency,requests,time_s,rps,p50_ms,p95_ms,p99_ms,failed,non_2xx" > "$CSV"

# Warm up the server before measurements.
ab -k -n 500 -c 10 "$URL" > /dev/null 2>&1

# Run measurements at each concurrency level.
for c in "${LEVELS[@]}"; do
    file="$RAW_DIR/ab-c${c}.txt"

    ab -k -n "$REQUESTS" -c "$c" "$URL" > "$file" 2>&1

    time=$(awk '/^Time taken for tests:/ {print $5}' "$file") # Extract total test execution time in seconds.
    rps=$(awk '/^Requests per second:/ {print $4}' "$file") # Extract requests per second (RPS).
    failed=$(awk '/^Failed requests:/ {print $3}' "$file") # Extract the number of failed requests.
    non_2xx=$(awk '/^Non-2xx responses:/ {print $3}' "$file") # Extract the number of non-2xx responses.
    p50=$(awk '/^  50%/ {print $2}' "$file") # Extract the 50th percentile response time (p50).
    p95=$(awk '/^  95%/ {print $2}' "$file") # Extract the 95th percentile response time (p95).
    p99=$(awk '/^  99%/ {print $2}' "$file") # Extract the 99th percentile response time (p99).

    echo "${c},${REQUESTS},${time:-0},${rps:-0},${p50:-0},${p95:-0},${p99:-0},${failed:-0},${non_2xx:-0}" >> "$CSV"

    sleep 5
done

echo "CSV: $CSV"
echo "Raw results: $RAW_DIR/"

