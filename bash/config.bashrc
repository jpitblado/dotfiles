# config.bashrc

unset TMOUT

# Default editor.
export EDITOR=vim

# Shell history options.
export HISTFILESIZE=500
export HISTSIZE=1000

# check bash version to set shopt direxpand, an alternative is to use
# CTRL-ALT-e instead of TAB to expand the macro
if [ ${BASH_VERSINFO[0]} -gt 4 ]
then
	shopt -s direxpand
elif [ ${BASH_VERSINFO[0]} -eq 4 ]
then
	if [ ${BASH_VERSINFO[1]} -gt 2 ]
	then
		shopt -s direxpand
	elif [ ${BASH_VERSINFO[1]} -eq 2 ]
	then
		if [ ${BASH_VERSINFO[2]} -ge 29 ]
		then
			shopt -s direxpand
		fi
	fi
fi

# end: config.bashrc
