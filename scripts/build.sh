#!/usr/bin/env sh
build(){
    cd pxt-lets-steam
    pxt buildtarget
    cd ..
}

build
