.PHONY : all
all : setup

setup : | install-pxt-cli install-pxt-lets-steam build

install-pxt : pxt/package-lock.json
pxt/package-lock.json:
	./scripts/install-pxt.sh

install-pxt-common-packages : pxt-common-packages/package-lock.json
pxt-common-packages/package-lock.json :
	./scripts/install-pxt-common-packages.sh

install-pxt-lets-steam : pxt-lets-steam/package-lock.json
pxt-lets-steam/package-lock.json:
	./scripts/install-pxt-lets-steam.sh

install-pxt-cli :
	./scripts/install-pxt-cli.sh

clean : | _clean setup

_clean :
	./scripts/clean.sh

link :
	./scripts/link.sh

build :
	./scripts/build.sh

serve :
	./scripts/serve.sh

package :
	./scripts/package.sh