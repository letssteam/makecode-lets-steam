#!/usr/bin/env sh
# Package into static website and test locally. See https://makecode.com/cli/staticpkg

package() {
    # Package and test locally
    # cd ../pxt; npm run build
    cd pxt-lets-steam || exit
    pxt staticpkg
    cd ..
}

package
