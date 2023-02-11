#!/bin/sh
#
#   allocscope  -  a memory tracking tool
#   Copyright (C) 2023  Matt Kimball
#
#   This program is free software: you can redistribute it and/or modify it
#   under the terms of the GNU General Public License as published by the
#   Free Software Foundation, either version 3 of the License, or (at your
#   option) any later version.
#
#   This program is distributed in the hope that it will be useful, but
#   WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
#   or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
#   for more details.
#
#   You should have received a copy of the GNU General Public License along
#   with this program. If not, see <https://www.gnu.org/licenses/>.
#

TARBALL=allocscope-0.1.0-static.tar.gz

if [ $(id -u) != 0 ]
then
    echo "Installation should be run as root:"
    echo ""
    echo "curl -s https://allocscope.com/install.sh | sudo sh"
    exit 1
fi

if [ $(uname -s) != Linux ]
then
    echo "Linux is currently the only operating system supported."
    exit 1
fi

if [ $(uname -m) != x86_64 ]
then
    echo "x86_64 is currently the only processor supported."
    exit 1
fi

echo Downloading $TARBALL
curl https://allocscope.com/release/$TARBALL -o /tmp/$TARBALL
echo ""

echo Installing $TARBALL
cd / && tar xf /tmp/$TARBALL
rm /tmp/$TARBALL

echo Success!
echo ""
echo To verify your allocscope installation works, try the following:
echo ""
echo allocscope-trace ls
echo allocscope-view ls.atrace
