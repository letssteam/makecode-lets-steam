#!/usr/bin/env bash
# Package into static website and test locally. See https://makecode.com/cli/staticpkg

package() {
    # Package and test locally
    # cd ../pxt; npm run build
    cd pxt-lets-steam
    export PXT_NODOCKER=1
    export PXT_FORCE_LOCAL=1
    export PXT_RUNTIME_DEV=1
    pxt staticpkg
    cd ..
}
package