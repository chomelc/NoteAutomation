#!/bin/bash

function create-note {
    OPTIND=1
    while getopts ":h" opt; do
    case "${opt}" in
        h) 
            python3 ~/Documents/NoteAutomation/notes.py $1 $2 $3
            cd $3
        ;;
        \?) 
            echo "Invalid option -$OPTARG."
            return 1
        ;;
    esac
    done
    if [ $OPTIND -eq 1 ]; 
    then 
        python3 ~/Documents/NoteAutomation/notes.py $1 $2; 
        cd $2
    fi
    shift $((OPTIND-1))    
    
    tput setaf 2; echo "Files successfully generated. You are now in the created file's folder."
}

function compile-note() {
    if [ "$#" -ne 1 ]; 
    then
        tput setaf 1; echo "Command failed. Enter the name of the note."
        return 1
    fi
    filename=$(basename -- "$1")
    extension="${filename##*.}"
    filename="${filename%.*}"
    cat header.md "$filename.$extension"| pandoc -s -o "$filename.pdf" --highlight-style=tango
}