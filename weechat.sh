#!/bin/bash

# WeeChat provision script, written by Som
set -e
set -u

_author="Som / somsubhra1 [at] xshellz.com"
_package="WeeChat"
_version="2.0.1"

dir="weechat"

echo "Running provision for package $_package version: $_version by $_author"

cd ~

if [ -d $dir ]
then
 echo "$dir is already present in $HOME. Aborting!"
 exit
fi

wget https://weechat.org/files/src/weechat-2.0.1.tar.gz

tar zxvf weechat-2.0.1.tar.gz

cd weechat-2.0.1

mkdir build

cd build

cmake .. -DCMAKE_INSTALL_PREFIX=$HOME/$dir

make

make install

echo "WeeChat Installed successfully"

cd ~

#CleanUp

rm weechat-2.0.1.tar.gz