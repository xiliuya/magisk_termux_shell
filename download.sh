#!/bin/bash
DOWN_LINK="https://github.com/xiliuya/gosu/releases/download/android_build/gosu-android_build-linux"

if [ -z $@ ];then
    ARCH_ARG=(arm arm64 amd64 386)
else
    TMP_STR=$1
    ARCH_ARG=(${TMP_STR:5})
fi
for arch in ${ARCH_ARG[@]}
do
    wget "$DOWN_LINK-$arch.tar.gz" -O "$arch.tar.gz"
    tar xf "$arch.tar.gz"
    rm -f "$arch.tar.gz"
    mv gosu gosu-$arch
done
