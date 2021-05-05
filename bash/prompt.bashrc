# prompt.bashrc

# bash completion
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
Linux)
	if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]
	then
		. /usr/share/git-core/contrib/completion/git-prompt.sh
	elif [ -f /etc/bash_completion ]
	then
		. /etc/bash_completion
	fi
	;;
esac
# removed 'class' from the list, Stata has *.class files
complete -f -X '*.@(o|so|so.!(conf)|a|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg)' vi vim gvim view gview

# bash prompt
if declare -F __git_ps1 >& /dev/null
then
	export GIT_PS1_SHOWDIRTYSTATE="true"
	export GIT_PS1_SHOWUNTRACKEDFILES="true"
	export GIT_PS1_SHOWSTASHSTATE="true"
	export GIT_PS1_SHOWUPSTREAM="true"
#	export PS1='\n\u@\h:\w\e[0;32m$(__git_ps1)\e[m\n\$ '
	pre='\n\u@\h:\w\e[0;32m'
	post='\e[m\n\$ '
	mid=" (%s)"
	export PROMPT_COMMAND="__git_svn_ps1 '$pre' '$post' '$mid'"
else
	export PS1='\n\u@\h:\w\n\$ '
fi
export PS2='> '

# end: prompt.bashrc
