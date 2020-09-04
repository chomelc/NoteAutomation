#!/bin/bash

function create-note {
    if [[ $# -eq 0 ]] ; then
        tput setaf 1; echo 'Wrong number of arguments: create-note [-h] <filename> <foldername>.'
        return 1
    fi

    OPTIND=1
    while getopts ":h" opt; do
    case "${opt}" in
        h) 
            python3 ~/Documents/NoteAutomation/notes.py $1 $2 $3
            if [ -n "$3" ] ; then
            echo "Changing directory to \"$3\"".
            cd $3
        fi
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
        if [ -n "$2" ] ; then
            echo "Changing directory to \"$2\"".
            cd $2
        fi
    fi
    shift $((OPTIND-1))    
    
    tput setaf 2; echo "Files successfully generated."
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
    if test -f header.md; 
    then
        cat header.md "$filename.$extension"| pandoc -s -o "$filename.pdf" --highlight-style=tango
    else
        pandoc -s "$filename.$extension" -o "$filename.pdf" --highlight-style=tango
    fi

}