#!/usr/bin/env bash

# building and compressing
git clone https://github.com/unix755/gobd
go build -C gobd -o "../gobd_runner"
chmod +x ./gobd_runner
./gobd_runner -os windows -d bin -no_debug -no_cgo

# delete all releases and their tags
gh release list | awk -F '\t' '{print $3}' | while read -r line; do gh release delete --yes --cleanup-tag "$line"; done

# create release
gh release create "$(go run . -v)" --generate-notes "bin/*"
