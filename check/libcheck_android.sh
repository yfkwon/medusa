#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Usage:"
	echo "./libcheck_android.sh {lib_name}"
else
	CONF=`arm-linux-androideabi-readelf -s $1 | grep nconf_`
	echo "$CONF"
fi
