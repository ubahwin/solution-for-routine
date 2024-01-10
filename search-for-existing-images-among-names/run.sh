#!/bin/zsh

file_with_names="names.txt"
folder_path="images"
output_file="output.txt"
echo "" > "$output_file"
found=false

while IFS= read -r name; do
    for file in $folder_path/*; do
        filee=$(basename "$file")
        filename=${filee:0:-4}

        if [[ " ${name} " =~ " ${filename} " ]]; then
            found=true
            break
        fi
    done

    if [[ "$found" == true ]]; then
        result="$filee"
        echo $filee
        found=false
    else
        result="-"
        echo "-"
    fi

    echo "$result" >> "$output_file"
done < "$file_with_names"
