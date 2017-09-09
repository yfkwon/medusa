#!/bin/bash

rm -f ${ABS_SRC_ROOT}/00_config/version/version.cpp

if ! [ -e "${ABS_SRC_ROOT}/00_config/version/version.cpp.template" ]; then
	echo "*** version.cpp.template file is not exist. ***"
	exit 1
fi

cp ${ABS_SRC_ROOT}/00_config/version/version.cpp.template ${ABS_SRC_ROOT}/00_config/version/version.cpp

DATE=`date '+%y%m%d%H'`
sed -i "s/#MIRACLE_VER#/${DATE}/g" ${ABS_SRC_ROOT}/00_config/version/version.cpp