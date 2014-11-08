#!/bin/bash

cd ..

export USE_CCACHE=1

PASS=0

### Handle first argument
# --s2ve = build for s2ve without cleaning
if [ "$1" = "--s2ve" ]; then
	PASS=1
	DEVICE=s2ve

# --s2vep = build for s2vep without cleaning
elif [ "$1" = "--s2vep" ]; then
	PASS=1
	DEVICE=s2vep

# no argument = ask for clean and device as usual
elif [ "$1" = "" ]; then
	echo -n "Make it clean? (y/N): "
	read CLEAN
	if [ "$CLEAN" = "y" ]; then
		make clean
	fi
fi
###

while [ $PASS -eq "0" ]; do
	echo -n "Device? ('s2ve' or 's2vep'): "
	read DEVICE
	if [ "$DEVICE" = "s2ve" ] || [ "$DEVICE" = "s2vep" ]; then 
		PASS=1
	else
		echo "Wrong input! Try again."
	fi
done

. build/envsetup.sh
brunch "$DEVICE"
