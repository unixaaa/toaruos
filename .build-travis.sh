#!/bin/bash

unset CC
pushd /home/build/osdev/toolchain
    . activate.sh || exit 1
    echo $PATH
    $TARGET-gcc --version
popd
pushd userspace
make || exit 1
popd
make system || exit 1
make test || exit 1
