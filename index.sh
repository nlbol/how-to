#!/bin/bash

# generate_index.sh

echo "# HOW-TO INDICE" > index.md
echo "" >> index.md

find . -maxdepth 2 -type d ! -path "." ! -path "./.*" | sort | while read -r folder; do
    if find "$folder" -maxdepth 1 -name "*.md" | grep -q .; then
        folder_name="${folder#./}"
        
        echo "## $folder_name" >> index.md
        echo "" >> index.md
        
        find "$folder" -maxdepth 1 -name "*.md" -type f | sort | while read -r file; do
            title=$(head -n 5 "$file" | grep -v '^$' | head -n 1 | sed 's/^#* //')

            if [[ -z "$title" ]]; then
                filename=$(basename "$file")
                if [[ "$filename" == "README.md" ]]; then
                    title="$folder_name"
                else
                    title=$(basename "$file" .md | sed 's/-/ /g; s/_/ /g')
                fi
            fi

            relative_path="${file#./}"

            echo "- [$title]($relative_path)" >> index.md
        done
        
        echo "" >> index.md
    fi
done

