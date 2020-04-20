# sh/pathmunge.sh

if [ -z "$ZSH_VERSION" ]
then
	. $DOTFILES/bash/pathmunge.bash
else
	. $DOTFILES/zsh/pathmunge.zsh
fi

# end: sh/pathmunge.sh
