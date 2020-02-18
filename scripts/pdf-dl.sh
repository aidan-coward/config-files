#!/bin/bash

# download file to /tmp/
wget --directory-prefix=/tmp/ "$1"

# open file with evince
setsid evince /tmp/"$(basename $1)"
