#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Usage:"
	echo "./project_select {project_name}"
else

PROJECT=$1

if ! [ -d $PROJECT ]; then
	echo "Error: $PROJECT is not exist"
else
	rm ./*.h 2>/dev/null
	rm ./*.mak 2>/dev/null
	cp $PROJECT/*.h ./ 2>/dev/null
	cp $PROJECT/*.mak ./ 2>/dev/null

	echo "OK: Project selection completed"
fi
fi
