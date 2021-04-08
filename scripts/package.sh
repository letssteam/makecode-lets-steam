#!/usr/bin/env bash
# Package into static website and test locally. See https://makecode.com/cli/staticpkg

package() {
    # Package and test locally
    # cd ../pxt; npm run build
    cd pxt-lets-steam
    pxt staticpkg && pxt serve -pkg
    cd ..
}
package