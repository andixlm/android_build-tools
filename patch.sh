#!/bin/bash

cd ..

COUNT=0
CURRENT_DIR="$PWD"
PATCHES=(
'frameworks/av					build_tools/patches/frameworks_av.patch'
'frameworks/base				build_tools/patches/frameworks_base.patch'
'frameworks/native				build_tools/patches/frameworks_native.patch'
'frameworks/opt/net/wifi		build_tools/patches/frameworks_opt_net_wifi.patch'
'frameworks/opt/telephony		build_tools/patches/frameworks_opt_telephony.patch'
'hardware/broadcom/libbt		build_tools/patches/hardware_broadcom_libbt.patch'
'packages/apps/Settings			build_tools/patches/packages_apps_Settings.patch'
'packages/services/Telephony	build_tools/patches/packages_services_Telephony.patch'
'system/core					build_tools/patches/system_core.patch'
)

while [ "x${PATCHES[COUNT]}" != "x" ]
do
	CURRENT="${PATCHES[COUNT]}"
    FOLDER=`echo "$CURRENT" | awk '{print $1}'`
	PATCH=`echo "$CURRENT" | awk '{print $2}'`

	cd "$FOLDER"
	echo Patching "$FOLDER" ...
	git apply "$CURRENT_DIR/$PATCH"
	cd "$CURRENT_DIR"

	COUNT=$(($COUNT + 1))
done
