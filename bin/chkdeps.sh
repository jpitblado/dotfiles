#!/bin/sh
# chkdeps.sh
# Copyright (c) 2006 Jeffrey S. Pitblado

self=`basename $0`
date=`date '+%y-%m-%d-%H%M%S%Z'`
tmp=/tmp/$self-$$
trap "rm -f $tmp;exit" 1 2 3 15

if [ "$1" != "now" ]
then
	cat 1>&2 <<EOF
Usage: $self now

Display a list of interdependenties of the script files within the current
directory.

EOF
	exit 1
fi

for file in *
do
	test -f $file || continue
	grep -l "^[ 	]*$file\>" * | grep -v "\<$file\>" >  $tmp
	grep -l "=.[ 	]*$file\>" * | grep -v "\<$file\>" >> $tmp
	grep -l "|[ 	]*$file\>" * | grep -v "\<$file\>" >> $tmp
	list=`cat $tmp | sort | uniq`
	if [ ! -z "$list" ]
	then
		echo "$file"
		for name in $list
		do
			echo "    $name"
		done
	fi
done

rm -f $tmp

exit
# end
