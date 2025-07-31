#!/bin/bash

SOURCE_DIR="Your/Calibre/folder"
DEST_DIR="/your/Komga/folder"

echo "🔁 Starting up hardlink replacement..."

find "$DEST_DIR" -type f \( -iname "*.epub" -o -iname "*.cbz" \) | while read -r dest_file; do
    filename=$(basename "$dest_file")

    # Search same mane
    found_original=$(find "$SOURCE_DIR" -type f -name "$filename" -print -quit)

    # If not found, search with less caracters 
    if [[ -z "$found_original" ]]; then
        base_without_ext="${filename%.*}"
        ext="${filename##*.}"
        found_original=$(find "$SOURCE_DIR" -type f -iname "${base_without_ext:0:40}*.$ext" -print -quit)
    fi

    if [[ -n "$found_original" ]]; then
        inode1=$(ls -i "$found_original" | awk '{print $1}')
        inode2=$(ls -i "$dest_file" | awk '{print $1}')

        if [[ "$inode1" != "$inode2" ]]; then
            echo "[Replaced] $filename"
            rm -f "$dest_file"
            ln "$found_original" "$dest_file"
        else
            echo "[Already HARDLINK] $filename"
        fi
    else
        echo "[Not Found] $filename"
    fi
done