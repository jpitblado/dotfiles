# config.bashrc

unset TMOUT

# Newly created file non-permissions.
case `id -ng` in
apache)
	umask 002
	;;
*)
	umask 022
	;;
esac

# Default editor.
export EDITOR=vim

# Shell history options.
export HISTFILESIZE=500
export HISTSIZE=1000

# end: config.bashrc
