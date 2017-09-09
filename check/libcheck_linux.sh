#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Usage:"
	echo "./libcheck_linux.sh {lib_name}"
else
	CONF=`readelf -s $1 | grep nconf_`
	echo "$CONF"
fi
