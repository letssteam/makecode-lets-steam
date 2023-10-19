#!/usr/bin/env sh

install_pxt() {
    cd pxt || exit
    npm install
    npm run build
    cd ..
}

install_pxt
