# svn-prompt.bashrc

__in_svn_repo ()
{
	local dir="$(pwd -P 2> /dev/null || echo "/")"
	while [ "$dir" != "/" ]
	do
		if [ -d "$dir/.svn" ]
		then
			return 0
		fi
		if [ -d "$dir/.git" ]
		then
			return 1
		fi
		dir="$(dirname "$dir")"
	done
	return 1
}

__svn_tok_next ()
{
	echo $* | sed -e 's#^/\([^/]*\).*#\1#'
}

__svn_tok_rest ()
{
	echo $* | sed -e 's#^/[^/]*\(.*\)#\1#'
}

__svn_path_tok1 ()
{
	local next="$1"
	local rest="$2"
	case "$next" in
	branches|tags)
		if [ -z "$rest" ]
		then
			echo "$next"
		else
			__svn_tok_next $rest
		fi
		;;
	trunk)
		echo "trunk"
		;;
	esac
}

__svn_path_tok2 ()
{
	local has_br="$(echo $* | sed -e 's#^.*/branches/.*##')"
	local has_ta="$(echo $* | sed -e 's#^.*/tags/.*##')"
	local has_tr="$(echo $* | sed -e 's#^.*/trunk\>.*##')"

	if [ -z "$has_br" ]
	then
		echo $* | sed -e 's#^.*/branches/\([^/]*/[^/]*\).*#\1#'
		return
	fi

	if [ -z "$has_ta" ]
	then
		echo $* | sed -e 's#^.*/\(tags/[^/]*\).*#\1#'
		return
	fi

	if [ -z "$has_tr" ]
	then
		echo $* | sed -e 's#^.*/\(trunk\>.*\).*#\1#'
		return
	fi

	__svn_tok_next "$*"
}

__svn_ps1 ()
{
	local ps1pc_start="$1"
	local ps1pc_end="$2"
	local printf_format="$3"

	local root="$(svn info 2>/dev/null | awk '/Root:/ {print $NF;}')"
	if [ -z "$root" ]
	then
		PS1="$ps1pc_start$ps1pc_end"
		return
	fi

	local full="$(svn info 2>/dev/null | awk '/^URL:/ {print $NF;}')"
	local full="$(echo $full | sed -e "s#$root##")"
	local next="$(__svn_tok_next $full)"
	local rest="$(__svn_tok_rest $full)"
	if [ -z "$next" ]
	then
		local loc="$(basename "$root")"
	elif [ -z "$rest" ]
	then
		local loc="$next"
	else
		local loc="$(__svn_path_tok1 "$next" "$rest")"
	fi
	if [ -z "$loc" ]
	then
		local loc="$(__svn_path_tok2 "$full")"
	fi
	local rev="$(svn info 2>/dev/null | awk '/^Revision:/ {print $NF;}')"

	local svnstring="${loc}:$rev"

	printf -v svnstring -- "$printf_format" "$svnstring"

	PS1="$ps1pc_start$svnstring$ps1pc_end"
}

if [ -r /etc/profile.d/vte.sh ]
then
	# defines __vte_prompt_command -- which sets the terminal path
	# so that new tabs and windows use the callers PWD
	. /etc/profile.d/vte.sh
fi

__git_svn_ps1 ()
{
	if declare -F __vte_prompt_command >& /dev/null
	then
		__vte_prompt_command
	fi
	if __in_svn_repo
	then
		__svn_ps1 "$@"
	else
		__git_ps1 "$@"
	fi
}

# end: svn-prompt.bashrc
