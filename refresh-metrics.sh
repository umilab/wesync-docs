#!/bin/sh
set -euo pipefail

rm -rf _syncthing
git clone --depth 1 https://github.com/umilab/wesync.git _syncthing
pushd _script
go run ./find-metrics ../_syncthing > ../includes/metrics-list.rst
popd
