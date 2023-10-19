#!/usr/bin/env sh

clean() {
    cd pxt-lets-steam || exit
    pxt clean
    cd ..
}

clean
