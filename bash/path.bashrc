# path.bashrc

case `uname` in
SunOS)	OPT="-s"
	;;
*)	OPT="-q"
	;;
esac

pathmunge () {
	if [ -d $1 ]
	then
		if ! echo $PATH | egrep $OPT "(^|:)$1(\$|:)"
		then
			if [ "$2" = "after" ]
			then
				PATH=$PATH:$1
			else
				PATH=$1:$PATH
			fi
		fi
	fi
}

# prepend these to the path
pathmunge /usr/local/bin
pathmunge $HOME/bin

# append these to the path
if ! echo $PATH | egrep $OPT "(^|:)\.(\$|:)"
then
	PATH=$PATH:.
fi

unset OPT
unset pathmunge

export PATH

# end: path.bashrc
