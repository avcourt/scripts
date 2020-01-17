#!/bin/bash
## Usage: `trim-vid <input.vid> <time in x:x:x>`
##
## - Trims the end off of a video
## - prompts for removal of original and renaming of trimmed version

if [ $# -ne 2 ]; then
    echo "Usage: trim-vid <input.vid> <time in x:x:x>"
    exit 1
fi

if [ -f "$1" ]; then
    if ffmpeg -noaccurate_seek -i "$1" -to "$2" -c copy trimmed-"$1" ; then
        echo 
        echo "Trim successful."
        echo 
        while true; do
            read -rp "Delete original $1? [y/N]" yn
            case $yn in
            [Yy]* ) rm -v "$1"; break;;
            [Nn]* ) exit ;;
            * ) echo "Please answer yes or no.";;
            esac
        done

        while true; do
            echo
            read -rp "Rename trimmed-$1 to $1? [y/N]" yn
            case $yn in
            [Yy]* ) mv -v trimmed-"$1" "$1"; break;;
            [Nn]* ) exit ;;
            * ) echo "Please answer yes or no.";;
            esac
        done
    
    else
        echo "Error: Trim failed"
    fi
else 
    echo "Error: File $1 does not exist"
fi