#!/usr/bin/env sh

build() {
    cd pxt-lets-steam || exit
    pxt buildtarget
    cd ..
}

build
