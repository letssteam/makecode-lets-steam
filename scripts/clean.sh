#!/usr/bin/env sh

clean() {
    cd pxt-lets-steam || exit
    pxt clean
    cd ..
    rm -Rf pxt/node_modules
    rm -Rf pxt-common-packages/node_modules
    rm -Rf pxt-lets-steam/node_modules
    
    rm -f package-lock.json
    rm -f pxt/package-lock.json
    rm -f pxt-common-packages/package-lock.json
    rm -f pxt-lets-steam/package-lock.json
}

clean
