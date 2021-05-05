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
		dir="$(dirname "$dir")"
	done
	return 1
}

__svn_ps1 ()
{
	local ps1pc_start="$1"
	local ps1pc_end="$2"
	local printf_format="$3"
	local svnstring=""

	if __in_svn_repo
	then
		local root="$(svn info | grep "Root:" | sed -e 's/.*Root: *//')"
		local url="$(svn info | grep "^URL:" | sed -e 's/^URL: *//')"
		local loc0="$(echo $url | sed -e "s#$root##")"
		local dir="$(pwd -P)"
		local base="$(basename $dir)"
		local loc1="$(echo $loc0 | sed -e "s#\(.*\)/$base#\1#")"
		local loc="$loc0"
		while [ "$loc0" != "$loc1" ]
		do
			local loc="$loc0"
			loc0="$loc1"
			local dir="$(dirname "$dir")"
			local base="$(basename $dir)"
			local loc1="$(echo $loc0 | sed -e "s#\(.*\)/$base#\1#")"
		done
		local loc="$(basename $loc)"
		local rev="$(svn info | grep "^Revision:" | awk '{print $NF}')"

		local svnstring="${loc}:$rev"

		printf -v svnstring -- "$printf_format" "$svnstring"
	fi

	PS1="$ps1pc_start$svnstring$ps1pc_end"
}

__git_svn_ps1 ()
{
	if __in_svn_repo
	then
		__svn_ps1 "$@"
	else
		__git_ps1 "$@"
	fi
}

# end: svn-prompt.bashrc
