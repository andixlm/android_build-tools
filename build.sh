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

# no first argument = ask for clean and device as usual
elif [ "$1" = "" ]; then
	echo -n "Make it clean? (y/N): "
	read CLEAN
	if [ "$CLEAN" = "y" ]; then
		make clean
	fi
fi
###

### Handle second argument
# --mb = make boot image without the whole ROM building
if [ "$2" = "--mb" ]; then
	SA=b

# --mr = make recovery image without the whole ROM building
elif [ "$2" = "--mr" ]; then
	SA=r
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

if [ "$SA" = "" ]; then
	. build/envsetup.sh
	brunch "$DEVICE"
elif [ "$SA" = "b" ]; then
	. build/envsetup.sh
	breakfast $DEVICE
	mka bootimage
elif [ "$SA" = "r" ]; then
	. build/envsetup.sh
	breakfast $DEVICE
	mka recoveryimage
fi
