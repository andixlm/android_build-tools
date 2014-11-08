#!/bin/bash

cd ..

# Reset changes and sync
repo forall -c 'git reset --hard ; git clean -fdx'
repo sync -f

# Get Terminal Emulator
./vendor/cm/get-prebuilts
