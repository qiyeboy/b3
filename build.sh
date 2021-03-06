#!/usr/bin/env bash

TOKEN=$1

[ -z $TOKEN ] && { echo "Token missing, please provide as first argument"; exit 4; }

which nexe 1>/dev/null || { echo "cannot find nexe binary to prepare static build, exiting..."; exit 3; }
which ghr  1>/dev/null || { echo "cannot find ghr binary to publish github release, exiting..."; exit 3; }
which npm  1>/dev/null || { echo "cannot find npm binary to publish package, exiting..."; exit 3; }

rm -rf build/

version=$(./cli.js --version)
if [[ $? != 0 ]]; then
    echo "could not determine version, received '${version}', exiting..."
    exit 2
fi

mkdir -p build/$version

echo "publishing to npm"
npm publish || { echo "publishing to npm failed, exiting..."; exit 1; }

echo "compiling static build of version ${version}"
nexe -i cli.js -o build/${version}/b3 -r grammar.pegjs || { echo "build failed, exiting..."; exit 1; }

echo "publishing build to github"
ghr -t $TOKEN -u dannykopping -r b3 -soft $version ./build/$version/b3 || { echo "publishing build failed, exiting..."; exit 1; }