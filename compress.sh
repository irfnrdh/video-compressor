#!/bin/bash

# Define the source directory containing .mov files
source_dir="."

# Define the export directory
export_dir="export_new"

# Create the export directory if it doesn't exist
mkdir -p "$export_dir"

# Loop through .mov files in the source directory and convert them to .mp4
for file in "$source_dir"/*.MOV; do
    if [ -e "$file" ]; then
        filename=$(basename "$file")
        filename_noext="${filename%.*}"  # Get the filename without extension
        ffmpeg -i "$file" -c:v libx264 -c:a aac -strict experimental "$export_dir/${filename_noext}_new.mp4"
    fi
done

echo "Conversion complete. Check the $export_dir directory for your converted files."

