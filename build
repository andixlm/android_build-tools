#!/bin/bash

cd ..

export USE_CCACHE=1

PASS=0

### Handle first argument
# no first argument = ask for clean and device
if [ -z $1 ]; then
	echo -n 'Make it clean? (y/N): '
	read CLEAN
	if [ "$CLEAN" = "y" ]; then
		make clean
	fi

# --i9105 = build for i9105 without cleaning
elif [ "$1" = "--i9105" ]; then
	PASS=1
	DEVICE=i9105

# --i9105p = build for i9105p without cleaning
elif [ "$1" = "--i9105p" ]; then
	PASS=1
	DEVICE=i9105p

else
	echo 'Wrong first argument! Stopping.'
	exit 1
fi
###

### Handle second argument
# --mb = make boot image without the whole ROM building
if [ '-n $1' -a "$2" = "--mb" ]; then
	SA=b

# --mr = make recovery image without the whole ROM building
elif [ '-n $1' -a "$2" = "--mr" ]; then
	SA=r

elif [ "$2" != "--mb" -o "$2" != "--mr" ]; then
	if [ "$2" != "" ]; then
		echo 'Wrong second argument! Stopping.'
		exit 1
	fi
fi
###

while [ $PASS -eq 0 ]; do
	echo -n 'Device? (i9105 or i9105p): '
	read DEVICE
	if [ "$DEVICE" = "i9105" ] || [ "$DEVICE" = "i9105p" ]; then 
		PASS=1
	else
		echo Wrong input! Try again.
	fi
done

if [ -z $SA ]; then
	. build/envsetup.sh
	brunch $DEVICE

elif [ "$SA" = "b" ]; then
	. build/envsetup.sh
	breakfast $DEVICE
	mka bootimage

elif [ "$SA" = "r" ]; then
	. build/envsetup.sh
	breakfast $DEVICE
	mka recoveryimage
fi
