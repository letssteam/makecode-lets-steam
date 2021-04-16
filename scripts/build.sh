#!/usr/bin/env bash
cd pxt-lets-steam
export PXT_FORCE_LOCAL=1
export PXT_NODOCKER=1 
export PXT_RUNTIME_DEV=1
pxt buildtarget
cd ..
