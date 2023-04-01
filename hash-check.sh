#!/bin/bash

# Prompt user for filename
read -p "Enter the name of the file to hash: " filename

# Check if file exists
if [ ! -f "$filename" ]; then
    echo "File not found!"
    exit 1
fi

# Calculate SHA-256 hash of file
hash=$(sha256sum "$filename" | awk '{print $1}')

# Print hash to console
echo "SHA-256 hash of $filename: $hash"

# Prompt user for filename of reference hash file
read -p "Enter the name of the reference hash file: " ref_file

# Check if reference hash file exists
if [ ! -f "$ref_file" ]; then
    echo "Reference hash file not found!"
    exit 1
fi

# Read reference hash from file
ref_hash=$(cat "$ref_file")

# Compare hashes
if [ "$hash" = "$ref_hash" ]; then
    echo "Integrity check successful!"
else
    echo "Integrity check failed!"
fi
