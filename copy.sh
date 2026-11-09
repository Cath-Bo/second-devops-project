#!/usr/bin/env bash

source_direction="$1"

if [[ ! -d "$source_direction" ]]; then
	echo "Error: source isn't a directory" >&2
	exit 1
fi

destination_direction="${2:-$HOME/copy}"
mkdir -p "$destination_direction"

archive_name="$(date +%m-%d-%H%M).tar.gz"
archive_path="$destination_direction/$archive_name"

while [[ -e "$archive_path" ]]; do
    sleep 1
    archive_name="$(date +%m-%d-%H%M).tar.gz"
    archive_path="$destination_direction/$archive_name"
done

#tar -czf "$archive_path" -C "$(dirname "$source_direction")" "$(basename "$source_direction")"

if ! tar -czf "$archive_path" -C "$(dirname "$source_direction")" "$(basename "$source_direction")"; then
    echo "Error: archive creation failed" >&2
    exit 3
fi

echo "size of the archive is $(du -h "$archive_path" )"

if ! tar -tzf "$archive_path" > /dev/null; then
    echo "Error: archive integrity check failed" >&2
    exit 1
fi
