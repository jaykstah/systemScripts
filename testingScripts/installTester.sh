#!/bin/bash

FILE=/usr/share/testing/datastuff
if [ -f "$FILE" ]; then
	echo "$FILE exists"
else
	echo "$FILE does not exist! Installing..."
	sudo touch /usr/share/testing/datastuff
fi

exit 0
