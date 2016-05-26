#!/usr/bin/env bash

set -e

script_dir=$(dirname $(readlink -f "$BASH_SOURCE"))

TMPDIR=$(mktemp -d)
pushd $TMPDIR

yaourt -G st-git
pushd st-git
cp -r . $script_dir

popd

git clone git://git.suckless.org/st
pushd st

cp config.def.h $script_dir/.
popd

popd
rm -rf $TMPDIR

