#!/bin/bash
# makegb
# Create a .gb file using rgbds
# GNU GPL V3.0

# usage:
# makegb {.asm input} {.o output} {.gb file}
# note: do not use file extensions. They are hardcoded!

echo "Creating output file..."
rgbasm -L -o $2.o $1.asm

echo "Creating .gb file..."
rgblink -o $3.gb $2.o

echo "Fixing .gb header..."
rgbfix -v -p 0xFF $3.gb

echo "Would you like to create a .sym file for debugging? (y/n)"
read createSym

if [ "$createSym" = "y" ];
then
    echo "Creating sym file..."
    rgblink -n $3.sym $2.o
    echo "Sym file created."

elif
	[ "$createSym" = "n" ];
then
    echo "No sym file will be created."
fi
