#!/bin/sh
# install.sh
# Installs dotfiles into $HOME, and creates a symbolic link to $HOME/.dotfiles
# if DOTFILES_ROOT isn't already pointing there.

DOTFILES_ROOT="`pwd`"
BACKUP="$DOTFILES_ROOT/backup"

link_files () {
	if [ -L "$2" ]
	then
		rm -f "$2"
	elif [ -f "$2" ] || [ -d "$2" ]
	then
		echo "Note: file $2 already exits"
		echo "      moving it to $BACKUP"
		mv "$2" "$BACKUP" || exit 1
	fi
	ln -s "$1" "$2"
	echo "Note: linked $1 to $2"
}

setup_gitconfig () {
	if ! [ -f git/gitconfig.symlink ]
	then
		echo "Note: setup gitconfig"

		case "`uname -s`" in
		Darwin)	git_cred_helper="osxkeychain"
			;;
		*)	git_cred_helper="cache"
			;;
		esac

		echo "Query: What is your git author name?"
		read -e git_authorname
		echo "Query: What is your git author email?"
		read -e git_authoremail

		sed	-e "s/AUTHORNAME/$git_authorname/"	\
			-e "s/AUTHOREMAIL/$git_authoremail/"	\
			-e "s/CRED_HELPER/$git_cred_helper/"	\
			git/gitconfig.symlink.example		\
			> git/gitconfig.symlink
	fi
}

install_dotfiles () {
	for src in `find "$DOTFILES_ROOT" -maxdepth 2 -name "*.symlink"`
	do
		dest="$HOME/.`basename \"${src%.*}\"`"
		link_files "$src" "$dest"
	done

	dest="$HOME/.dotfiles"
	if [ "$DOTFILES_ROOT" != "$dest" ]
	then
		link_files "$DOTFILES_ROOT" "$dest"
	fi
}

mkdir "$BACKUP" || exit 1

setup_gitconfig
install_dotfiles

if [ `/bin/ls -a "$BACKUP" | wc | awk '{print \$1}'` -gt 2 ]
then
	echo "Note: contents of $BACKUP"
	/bin/ls -a $BACKUP
else
	rmdir "$BACKUP"
fi

echo "Finished."

# end: install.sh
