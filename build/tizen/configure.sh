#!/bin/bash
if [[ "$OSTYPE" == "cygwin" ]]; then
	echo -e "\E[2J"
else
	clear
fi

echo "+============================+"
echo "|  Architecture for TIZEN    |"
echo "+----------------------------+"
echo "| 1. arm                     |"
echo "| 2. x86                     |"
echo "+============================+"
echo 
echo -n "Select configuration [1 or 2]: "; read arch

if [ "$arch" == "1" ]; then
	echo
	echo "===== arm ====="
	echo
	export ARCHS=arm
	export TC_PREFIX=arm-linux-gnueabi-
elif [ "$arch" == "2" ]; then
	echo
	echo "===== x86 ====="
	echo
	export ARCHS=x86
	export TC_PREFIX=i386-linux-gnueabi-
else
	echo
	echo "===== Invalid ====="
	echo
fi

echo "+============================+"
echo "| CONFIGURATIONS for TIZEN   |"
echo "+----------------------------+"
echo "| 1. Debug                   |"
echo "| 2. Release                 |"
echo "+============================+"
echo 
echo -n "Select configuration [1 or 2]: "; read input

if [ "$input" == "1" ]; then
	echo
	echo "=====  Debug ====="
	echo
	export CONFIGURATION=debug
elif [ "$input" == "2" ]; then
	echo
	echo "===== Release ====="
	echo
	export CONFIGURATION=release
else
	echo
	echo "===== Invalid ====="
	echo
fi


