#!/bin/sh
FILE_START="start_time.tmp"
FILE_END="end_time.tmp"

if [ $1 -eq 0 ]; then
	rm -f $FILE_START $FILE_END
	touch $FILE_START
	exit 0
fi

if [ $1 -eq 1 ]; then
	touch $FILE_END
	START_TIME=$(stat -c %X $FILE_START)
	END_TIME=$(stat -c %X $FILE_END)
	echo "=========================================="
	echo "Takes $(($END_TIME - $START_TIME)) second(s)."
	echo "=========================================="
	rm -f $FILE_START $FILE_END
	exit 0
fi
