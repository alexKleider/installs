#!/bin/bash
# file: encrypt.sh
# Encrypts.
# Usage: encrypt.sh file
# Encrypts file into file.gpg and deletes file

# We don't want to delete (shred) unless encryption was successful:
gpg -c $1 && shred --remove $1

