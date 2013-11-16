# prompt.bashrc

if type __git_ps1 >& /dev/null
then
	export GIT_PS1_SHOWDIRTYSTATE="true"
	export GIT_PS1_SHOWUNTRACKEDFILES="true"
	export GIT_PS1_SHOWSTASHSTATE="true"
	export GIT_PS1_SHOWUPSTREAM="true"
	export PS1='\n\u@\h:\w\e[0;32m$(__git_ps1)\e[m\n\$ '
else
	export PS1='\n\u@\h:\w\n\$ '
fi
export PS2='> '

# end: prompt.bashrc
