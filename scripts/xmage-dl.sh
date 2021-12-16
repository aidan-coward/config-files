#!/usr/bin/env bash

set -o errexit # exit when a command fails 
set -o pipefail # fail when a pipe fails 
set -o nounset # fail on access of nonexistent variable
# set -o xtrace # print all commands 

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"
# _FILE="$(basename $1)"

######################

# download new index.html for list of versions
wget -N http://xmage.de/files/

# assign file variable
_FILE=$(grep -E "[0-9]{4}-[0-9]{2}-[0-9]{2}" index.html | grep xmage_ | tac | head -n 1 | sed 's/.*href="//' | sed 's|zip.*|zip|')

# download file to directory
wget --no-clobber --directory-prefix=./ http://xmage.de/files/"$_FILE"

# assign new pkgver
# remove xmage, then remove extension
_PKGVER=$(echo "$_FILE" | cut --delimiter=_ --fields=2 | rev | cut --delimiter=. --fields=2- | rev)
echo $_PKGVER

# replace old pkgver with new
sed --in-place "s|pkgver=.*$|pkgver=$_PKGVER|" PKGBUILD
sed --in-place "s|pkgver=.*$|pkgver=$_PKGVER|" PKGBUILD-jre-8u201-x86_64

# assign checksum
_CHECKSUM_NEW=$(sha256sum ./"$_FILE" | cut --delimiter=" " -f 1)

# assign checksum line number
_CHECKSUM_LINE_NUM=$(grep -n -m 1 -E '[0-9a-f]{64}' PKGBUILD | cut --fields=1 --delimiter=':')
_CHECKSUM_LINE_NUM=$(grep -n -m 1 -E '[0-9a-f]{64}' PKGBUILD-jre-8u201-x86_64 | cut --fields=1 --delimiter=':')

# assign old checksum
_CHECKSUM_OLD=$(sed -n "$_CHECKSUM_LINE_NUM"p PKGBUILD | sed 's/sha256sums=("//' | sed 's/"//' | sed 's/ //')
_CHECKSUM_OLD=$(sed -n "$_CHECKSUM_LINE_NUM"p PKGBUILD-jre-8u201-x86_64 | sed 's/sha256sums=("//' | sed 's/"//' | sed 's/ //')

# replace old checksum with new checksum
sed --in-place "s|$_CHECKSUM_OLD|$_CHECKSUM_NEW|" PKGBUILD 
sed --in-place "s|$_CHECKSUM_OLD|$_CHECKSUM_NEW|" PKGBUILD-jre-8u201-x86_64

# set pkgrel to 0
sed --in-place "s|pkgrel=.*$|pkgrel=0|" PKGBUILD
sed --in-place "s|pkgrel=.*$|pkgrel=0|" PKGBUILD-jre-8u201-x86_64


# build package 
makepkg -sif

# copy PKGBUILD to aur dir
# copy PKGBUILD-jre-8u201-x86_64 to aur dir
cp PKGBUILD /home/aidan/aur/xmage/
cp PKGBUILD-jre-8u201-x86_64 /home/aidan/aur/xmage/

cd ~/aur/xmage
