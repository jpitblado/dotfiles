#!/bin/sh
# git-status.sh

self=`basename $0`

Usage () {
	cat <<EOF
Usage: $self <subcmd>

Loop thru local subdirectories of the current folder and run

	git <subcmd>

within each that is a git repository.

Most commonly used examples:

	$self remote --verbose
	$self pull origin
	$self status --short
	$self gc
EOF
	exit 1
}

if [ $# -eq 0 ]
then
	Usage
fi

h=`pwd`

for d in */
do
	cd "$h/$d"
	if [ -d .git ]
	then
		echo
		echo "running git in $d"
		git $@ || exit 1
	else
		echo
		echo "$d is not a git repo; skipping..."
	fi
done

# end: git-status.sh
