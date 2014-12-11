#!/bin/bash

cd ..

# Reset changes
# Use -o for resetting changes only.
repo forall -c 'git reset --hard ; git clean -fdx'

# Sync repos
if [[ "-o" != "$1" ]]; then
	repo sync -f
fi

# Get Terminal Emulator
./vendor/cm/get-prebuilts
