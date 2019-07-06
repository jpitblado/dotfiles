#!/bin/sh
# path.sh
#
# Show path elements, one per line.

for el in `echo $PATH | sed -e 's/:/ /g'`
do
	echo "$el"
done

# end: path.sh
