#!/bin/bash
if [[ "$OSTYPE" == "cygwin" ]]; then
	echo -e "\E[2J"
else
	clear
fi

echo "+============================+"
echo "|      ABI for ANDROID       |"
echo "+----------------------------+"
echo "| 1. armeabi                 |"
echo "| 2. armeabi-v7a             |"
echo "| 3. arm64-v8a               |"
echo "|                            |"
echo "| 4. 32bit all               |"
echo "| 5. all                     |"
echo "+============================+"
echo 
echo -n "Select configuration [1, 2, 3, 4, 5]: "; read abi

if [ "$abi" == "1" ]; then
	echo
	echo "===== armeabi ====="
	echo
	export ARCHS="armeabi"
elif [ "$abi" == "2" ]; then
	echo
	echo "===== armeabi-v7a ====="
	echo
	export ARCHS="armeabi-v7a"
elif [ "$abi" == "3" ]; then
	echo
	echo "===== arm64-v8a ====="
	echo
	export ARCHS="arm64-v8a"
elif [ "$abi" == "4" ]; then
	echo
	echo "===== 32bit all (armeabi & amreabi-v7a) ====="
	echo
	export ARCHS="armeabi armeabi-v7a"
elif [ "$abi" == "5" ]; then
	echo
	echo "===== all ====="
	echo
	export ARCHS="armeabi armeabi-v7a arm64-v8a"
else
	echo
	echo "===== Invalid ====="
	echo
fi

echo "+============================+"
echo "| CONFIGURATIONS for ANDROID |"
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


