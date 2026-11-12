#!/bin/bash

directory="$1"

if [[ ! -d "$directory" ]]; then
	echo "Error: directory does't exist"
	exit 1
fi

declare -A extensions

file_count=0
directory_count=$(find "$directory" -mindepth 1 -type d -printf '.' | wc -c)
largest_file=""
largest_size=0

while IFS= read -r -d '' file; do
    ((file_count++))

    filename="${file##*/}"
    extension="${filename##*.}"

    if [[ "$filename" != *.* ]]; then
        extension="(no extension)"
    fi

    ((extensions["$extension"]++))

    size=$(stat -c '%s' "$file")

    if (( file_count == 1 || size > largest_size )); then
        largest_size="$size"
        largest_file="$file"
    fi

done < <(find "$directory" -type f -print0)
printf "%-20s %10s\n" "Extension" "Count"

for extension in "${!extensions[@]}"; do
    printf "%s\t%d\n" "$extension" "${extensions[$extension]}"
done | sort -rn -k2,2 | while IFS=$'\t' read -r extension count; do
    printf "%-20s %10d\n" "$extension" "$count"
done
echo
printf "Files: %d\n" "$file_count"
printf "Directories: %d\n" "$directory_count"
printf "Largest file: %s (%s bytes)\n" "$largest_file" "$largest_size"
