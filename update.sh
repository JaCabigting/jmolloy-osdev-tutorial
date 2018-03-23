#!/bin/bash

CURRENT=`pwd`
TARGET=$1

cd $TARGET/src
make
cp kernel $CURRENT
make clean
cd $CURRENT

sudo /sbin/losetup /dev/loop0 floppy.img
mkdir mnt
sudo mount /dev/loop0 mnt
sudo cp kernel mnt/kernel
sudo umount /dev/loop0
sudo /sbin/losetup -d /dev/loop0
rmdir mnt
