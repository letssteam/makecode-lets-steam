#!/usr/bin/env bash
cd pxt-lets-steam
export PXT_NODOCKER=1
export PXT_FORCE_LOCAL=1
export PXT_RUNTIME_DEV=1
pxt serve --localbuild --no-browser --no-serial -h 0.0.0.0 --sourceMaps
cd ..
