# completion.bashrc

case `uname` in
Darwin)	
	if type brew >& /dev/null
	then
		if [ -f "`brew --prefix`/etc/bash_completion" ]
		then
			. "`brew --prefix`/etc/bash_completion"
		fi
	fi
	;;
esac

# end: completion.bashrc
