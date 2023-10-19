#!/usr/bin/env sh

install_pxt(){
    cd pxt
    npm install
    npm run build
    cd ..
}

install_pxt