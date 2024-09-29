#!/bin/bash

# Loop over all the files
for file in *; do
  # Extract the roll number (the digits at the start of the filename)
  roll=$(echo "$file" | grep -oP '^\d+')

  # Ensure the roll number is not empty
  if [[ -n "$roll" ]]; then
    # Add .pdf if missing
    ext="${file##*.}"
    if [[ "$ext" != "pdf" ]]; then
      file="$file.pdf"
      mv "$file" "$file.pdf"
    fi
    
    # Construct the target filename with the correct format and letter case
    target="${roll}_Lab_01.pdf"

    # Rename the file only if the current name is different from the target name
    if [[ "$file" != "$target" ]]; then
      mv "$file" "$target"
      echo "Renamed: $file -> $target"
    else
      echo "Skipping: $file (already correctly named)"
    fi
  else
    echo "Skipping: $file (no roll number detected)"
  fi
done

