#!/usr/bin/env bash
cd pxt-lets-steam
export PXT_NODOCKER=1
export PXT_FORCE_LOCAL=1
pxt serve --localbuild --no-browser
cd ..
