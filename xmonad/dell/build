#!/bin/sh

set -o errexit # exit when a command fails 
set -o pipefail # fail when a pipe fails 
set -o nounset # fail on access of nonexistent variable
# set -o xtrace # print all commands 

######################

exec stack ghc -- \
	--make xmonad.hs \
	-i \
	-ilib \
	-fforce-recomp \
	-main-is main \
	-v0 \
	-o "$1"jk
