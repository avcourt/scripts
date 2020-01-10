#!/bin/bash
## Usage: `create-readme`
##
## - creates a readme with a description of each script

README=README.md

if [[ -f "$README" ]]; then
    echo "$README already exists. Updating with new scripts."
else
    echo "Creating README with script information."
fi

printf "# create-readme\n\n" > $README
printf "Creates a README with info about each script in this directory\n" >> $README

for f in *.sh; do
    printf "\n## $f\n\n" >> $README
    #echo "\`\`\`" >> $README
    sed -n '/^##/p' "$f" | tr -d '#' >> $README
    # printf "\`\`\`\n\n" >> $README
done
