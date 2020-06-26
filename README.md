# NoteAutomation v1.0

A script to help generate markdown note taking files and convert them to PDF via pandoc. 

## Features

- Generate a markdown note taking file, either with a front page (or *header*) or not.
- Compile the markdown file(s) via pandoc to get a PDF file.

## Prerequesites

- Install [Pandoc](https://pandoc.org/installing.html).

## How-to

First, add the following line to your `.bashrc` file:
```shell
source ~/<path to this folder>/.note_commands.sh
```

Then, you will be able to use the `create-note` and `compile-note` commands:

- `create-note [-h] <filename> <foldername>` will generate a markdown file in the specified folder relative to the current path. It will also change the current path to that folder and open the generated file in VSCode.
  - The `-h` option generates a *header* file, aka a front page.
- `compile-note <filename>.md` will convert the markdown file to a PDF file.