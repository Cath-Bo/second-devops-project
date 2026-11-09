#!/bin/bash

directory="$1"

if [[ ! -d "$directory" ]]; then
	echo "Error: directory does't exist"
	exit 1
fi

