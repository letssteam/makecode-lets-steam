#!/usr/bin/env sh

link(){
    cd pxt-lets-steam

    if [ -d "node_modules/pxt-core" ]
    then
        rm -R "node_modules/pxt-core"
        pxt link ../pxt

    fi

    if [ -d "node_modules/pxt-common-packages" ]
    then
        rm -R "node_modules/pxt-common-packages"
        pxt link ../pxt-common-packages
    fi

    cd ..
}

link