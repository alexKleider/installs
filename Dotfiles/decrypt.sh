#!/bin/bash
# file: decrypt.sh
# usage: decrypt.sh file
# Decrypts file.gpg into file.

f=$1

gpg -d --output $f ${f}.gpg
