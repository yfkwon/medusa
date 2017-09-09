#!/bin/bash
clear

echo "+============================+"
echo "|  CONFIGURATIONS for Linux  |"
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

echo CONFIGURATION=$CONFIGURATION
