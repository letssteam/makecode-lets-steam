#!/usr/bin/env sh

serve(){
    cd pxt-lets-steam
    pxt serve --no-browser --no-serial -h '0.0.0.0'
    cd ..
}
serve