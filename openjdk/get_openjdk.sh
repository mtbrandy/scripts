#!/bin/bash
set -x

if [ $# -ne 2 ]; then
    echo "usage: `basename $0` <git-repo> <tag-or-branch>"
    exit 1
fi

REPO=$1
TAG=$2
WORK_DIR=$PWD/get-openjdk

git clone $REPO -b $TAG $WORK_DIR
if [ $? -ne 0 ]; then
    exit 1;
fi

cd $WORK_DIR
bash ./configure
if [ $? -ne 0 ]; then
    exit 1;
fi

make all
if [ $? -ne 0 ]; then
    exit 1;
fi

exit 0
