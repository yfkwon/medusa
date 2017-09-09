#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Usage:"
	echo "./libcheck_ios.sh {lib_name}"
else
	CONF=`nm -g $1 | grep nconf_`
	echo "$CONF" 
fi

