#!/bin/bash
clear

echo "+===========================+"
echo "|  Architectures for OS X   |"
echo "+---------------------------+"
echo "| 1. x86_64                 |"
echo "| 2. i386                   |"
echo "| 3. Universal              |"
echo "+===========================+"
echo
echo -n "Select architecture [1, 2, 3]: "; read input_arch

if [ "$input_arch" == "1" ]; then
	echo
	echo "===== x86_64 ====="
	echo
	export ARCHS="x86_64"
elif [ "$input_arch" == "2" ]; then
	echo
	echo "===== i386 ====="
	echo
	export ARCHS="i386"
elif [ "$input_arch" == "3" ]; then
	echo
	echo "===== Universal (x86_64 & i386) ====="
	echo
	export ARCHS="x86_64 i386"
else
	echo
	echo "===== Invalid ====="
	echo
fi


echo "+===========================+"
echo "|  CONFIGURATIONS for OS X  |"
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


