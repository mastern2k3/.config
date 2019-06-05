#!/bin/sh

DIR="$( dirname "$(readlink -f "$0")" )"

cp $DIR/fonts/* /usr/local/share/fonts
fc-cache -f -v

