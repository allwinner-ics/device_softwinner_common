#!/bin/bash
function cdevice()
{	
	cd $DEVICE
}

function cout()
{
	cd $OUT	
}

function extract-bsp()
{
	LICHEE_DIR=$ANDROID_BUILD_TOP/../lichee
	LINUXOUT_DIR=$LICHEE_DIR/out/android
	LINUXOUT_MODULE_DIR=$LICHEE_DIR/out/android/lib/modules/*/*
	CURDIR=$PWD

	cd $DEVICE

	#extract kernel
	if [ -f kernel ]; then
		rm kernel
	fi
	cp $LINUXOUT_DIR/bImage kernel

	#extract linux modules
	if [ -d modules ]; then
		rm -rf modules
	fi
	mkdir -p modules/modules
	cp -rf $LINUXOUT_MODULE_DIR modules/modules
	chmod 0755 modules/modules/*

# create modules.mk
(cat << EOF) > ./modules/modules.mk 
# modules.mk generate by extract-files.sh , do not edit it !!!!
PRODUCT_COPY_FILES += \\
	\$(call find-copy-subdir-files,*,\$(LOCAL_PATH)/modules,system/vendor/modules)

EOF

	cd $CURDIR	
}

function pack()
{
	T=$(gettop)
	export CRANE_IMAGE_OUT=$OUT
	export PACKAGE=$T/../lichee/tools/pack	
	sh $DEVICE/package.sh $1
}

function exdroid_diff()
{
	echo "please check v1, v2 in build/tools/exdroid_diff.sh (^C to break)"
	read
	repo forall -c '$ANDROID_BUILD_TOP/build/tools/exdroid_diff.sh'	
}

function exdroid_patch()
{
	echo "please confirm this is v1 (^C to break)"
	read
	repo forall -c '$ANDROID_BUILD_TOP/build/tools/exdroid_patch.sh'	
}
