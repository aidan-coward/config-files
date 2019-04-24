#!/bin/bash

# download file to /tmp/
wget -P /tmp/ "$1"

# open file with evince
setsid evince /tmp/"$(basename $1)"
