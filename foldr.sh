#!/bin/bash

DIR=`pwd`
target=$DIR
cd "$DIR"

for file in *; do
    # Top tear folder name
    year=$(stat -f "%Sm" -t "%Y" $file)
    # Secondary folder name
    subfolderName=$(stat -f "%Sm" -t "%Y%m%d-" $file)

    if [ ! -d "$target/$year" ]; then
        mkdir "$target/$year"
        echo "starting new year: $year"
    fi
    if [ ! -d "$target/$year/$subfolderName" ]; then
        mkdir "$target/$year/$subfolderName"
        echo "starting new day & month foldero: $subfolderName"
    fi
    echo "moving file $file"
    mv "$file" "$target/$year/$subfolderName"

done
