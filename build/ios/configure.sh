#!/bin/bash
clear

IPHONE_OS_PLATFORM="iPhoneOS"
IPHONE_SIM_PLATFORM="iPhoneSimulator"

echo "+===========================+"
echo "|  Architectures for iOS    |"
echo "+---------------------------+"
echo "| 1. armv7                  |"
echo "| 2. arm64                  |"
echo "| 3. Universal              |"
echo "|                           |"
echo "| 4. x86_64 (Simulator)     |"
echo "+===========================+"
echo
echo -n "Select architecture [1, 2, 3, 4]: "; read input_arch

if [ "$input_arch" == "1" ]; then
	echo
	echo "===== armv7 ====="
	echo
	export PLATFORM=$IPHONE_OS_PLATFORM
	export ARCHS="armv7"
elif [ "$input_arch" == "2" ]; then
	echo
	echo "===== arm64 ====="
	echo
	export PLATFORM=$IPHONE_OS_PLATFORM
	export ARCHS="arm64"
elif [ "$input_arch" == "3" ]; then
	echo
	echo "===== Universal (armv7 & arm64) ====="
	echo
	export PLATFORM=$IPHONE_OS_PLATFORM
	export ARCHS="armv7 arm64"
elif [ "$input_arch" == "4" ]; then
	echo
	echo "===== x86_64 (Simulator) ====="
	echo
	export PLATFORM=$IPHONE_SIM_PLATFORM
	export ARCHS="x86_64"
else
	echo
	echo "===== Invalid ====="
	echo
fi


echo "+===========================+"
echo "|  CONFIGURATIONS for iOS   |"
echo "+---------------------------+"
echo "| 1. Debug                  |"
echo "| 2. Release                |"
echo "+===========================+"
echo 
echo -n "Select configuration [1 or 2]: "; read input_config

if [ "$input_config" == "1" ]; then
	echo
	echo "=====  Debug ====="
	echo
	export CONFIGURATION="debug"
elif [ "$input_config" == "2" ]; then
	echo
	echo "===== Release ====="
	echo
	export CONFIGURATION="release"
else
	echo
	echo "===== Invalid ====="
	echo
fi

