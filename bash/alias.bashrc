# alias.bashrc
# common everyday aliases

# directory navigation
alias ,='pushd .'
alias ,,='popd'
alias ..='cd ..'

# default options
alias rm='rm -i'
alias mv='mv -i'

# g and h macro setup -- useful for file/directory comparisons
alias dh='echo "h=$h"; echo "g=$g"'
alias hh='export g=$h; export h=`pwd`; dh'

# date and time
alias Now='date '+%Y-%m-%d-%H%M%Z''
alias now='date '+%y-%m-%d-%H%M%Z''
alias TODAY='date '+%d%b%Y''
alias Today='date '+%Y-%m-%d''
alias today='date '+%y-%m-%d''
case "`uname`" in
Darwin)
	alias lfriday="date -v-fri '+%y-%m-%d'"
	;;
*)
	alias lfriday="date '+%y-%m-%d' -d 'last friday'"
	;;
esac
alias ndate='date '+%Y%m%d''

# 'ls' shortcuts
alias l='ls -lL'
alias l.='ls -d .*'
alias la='ls -AC'
alias lf='ls -d `/bin/ls | grep -v [.]`'
alias ll='ls -al'
alias lr='ls -ARl'
alias lt='ls -Alt'

# OS specific
case "`uname`" in
Darwin)
	alias acroread='open -a "Adobe Reader"'
	alias chrome='open -a "Google Chrome"'
	alias firefox='open -a "/Applications/Firefox.app"'
	export CLICOLOR=1
	export LSCOLORS=ExGxBxDxCxegedabagacad
	alias ls='ls -Fv'
	;;
*)
	# File type and extension color highlighting.
	if type dircolors >& /dev/null
	then
		if [ -f $DOTFILES/linux/ls-colors ]
		then
			eval `dircolors --sh $DOTFILES/linux/ls-colors`
			alias ls='ls --color -Fv'
		fi
	else
		alias ls='ls -Fv'
	fi
	;;
esac

# end: alias.bashrc
