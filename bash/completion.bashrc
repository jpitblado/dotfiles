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

# removed 'class' from the list, Stata has *.class files
complete -f -X '*.@(o|so|so.!(conf)|a|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg)' vi vim gvim view gview

# end: completion.bashrc
