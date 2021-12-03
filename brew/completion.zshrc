# brew/completion.zshrc

if type brew &>/dev/null
then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

# end: brew/completion.zshrc
