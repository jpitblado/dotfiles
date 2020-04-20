# bash/pathmunge.bash

. $DOTFILES/sh/debug_msg.sh

pathmunge () {
	if [ -d $1 ]
	then
		if ! echo $PATH | egrep "(^|:)$1(\$|:)" > /dev/null 2>&1
		then
			if [ "$2" = "after" ]
			then
				debug_msg "$1 appended to PATH"
				PATH=$PATH:$1
			else
				debug_msg "$1 prepended to PATH"
				PATH=$1:$PATH
			fi
		else
			debug_msg "$1 already in PATH"
		fi
	else
		debug_msg "$1 is not a directory"
	fi
}

# end: bash/pathmunge.bash
