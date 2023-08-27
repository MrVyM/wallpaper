#!/bin/bash

backup_file=".tempReadme"

function converting()
{
    name=$1
    newName=$(echo "$(basename "$1" | sed 's/\(.*\)\..*/\1/')".png)
    echo "Converting ${name} to ${newName}"
    convert $name $newName
    echo "![${newName}](${newName})" >> $backup_file
    rm $name
}

echo -e "# Wallpapers\n" > $backup_file
for f in $(ls | grep -v ".md\|.sh")
do 
    if [[ ! $(echo $f | grep .png) ]] 
    then 
        converting $f
    else 
        echo "![${f}](${f})" >> $backup_file
    fi
done

cat README.md $backup_file | uniq > README.md