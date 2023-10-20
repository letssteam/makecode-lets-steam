#!/usr/bin/env sh

install_pxt_cli(){
    if ! [ -x "$(command -v pxt)" ]
    then
        # Install pxt
        npm install -g pxt
    fi 
}

install_pxt_cli