# zsh/pathmunge.zsh

. $DOTFILES/sh/debug_msg.sh

pathmunge () {
	if [ -d $1 ]
	then
		local plist
		plist=("${(s/:/)PATH}")
		if [[ ${plist[(ie)$1]} -gt ${#plist} ]]
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

# end: zsh/pathmunge.zsh
