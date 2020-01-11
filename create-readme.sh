#!/bin/bash
## Usage: `create-readme`
##
## - creates a readme with a description of each script

README=README.md
S_NAME="$(basename "$0")"

if [[ -f "$README" ]]; then
    echo "${README} already exists. Updating with new scripts."
else
    echo "Creating a readme with script information."
fi

printf "# Scripts\n\n" > $README
printf "Various shell scripts. This readme created by [%s](%s)\n" "$S_NAME" "$S_NAME" >> $README
printf "\n## Script Descriptions\n" >> $README

for f in *.sh; do
    {
        printf "\n### [%s](%s)\n\n" "$f" "$f"
        sed -n '/^##/p' "$f" | cut -c 4-
        printf "\n***\n"
     } >> $README
done
