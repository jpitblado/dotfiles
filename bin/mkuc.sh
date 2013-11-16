#!/bin/sh
# mkuc.sh
# Copyright (c) 2003 Jeffrey S. Pitblado

self=`basename $0`
# -sed- script
myscr=`dirname $0`/`basename $0 .sh`.sed

Usage () {
	cat 1>&2 << EOF
Usage: $self <filenames>

This script will rename the files in <filenames>, converting all lowercase
letters to uppercase.

EOF
	exit 1
}

if [ ${#} -eq 0 ]
then
	Usage
fi

if [ ! -f $myscr ]
then
	echo "$self: $myscr: file not found" 1>&2
	Usage
fi

for name in ${*}
do
	newname=`echo $name | sed -f $myscr`
	if [ "$name" = "$newname" ]
	then
		echo "nothing to do for $name"
	else
		echo "$name ==> $newname"
		mv "$name" "$newname"
	fi
done

exit
