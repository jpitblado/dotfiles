# Jeff's dotfiles

## dotfiles

I use these dotfiles to manage my `bash` environment.
I'm also starting to use `zsh` on macOS.

My dotfiles are organized very similarly to 
[Zack Holman's](https://github.com/holman)
[dotfiles](https://github.com/holman/dotfiles).

## install

Run this:

```sh
git clone https://github.com/jpitblado/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
install.sh
```

`install.sh` symlinks certain files in `~/.dotfiles` to `$HOME`.

For `bash`, update your `.bashrc` file to include
`$HOME/.dotfiles/bash/bashrc`.

For `zsh`, update your `.zshrc` file to include
`$HOME/.dotfiles/zsh/zshrc`.

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there.
Anything with an extension of `.bashrc` or `.shrc` will get automatically
included into your `bash` shell.
Anything with an extension of `.zshrc` or `.shrc` will get automatically
included into your `zsh` shell. 
Anything with an extension of `.symlink` will get symlinked without
extension into `$HOME` when you run `install.sh`.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.bashrc**: Any files ending in `.bashrc` get loaded into your
  `bash` environment.
- **topic/\*.zshrc**: Any files ending in `.zshrc` get loaded into your
  `zsh` environment.
- **topic/\*.shrc**: Any files ending in `.shrc` get loaded into your
  `bash` or `zsh` environment.
- **topic/\*.symlink**: Any files ending in `.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `install.sh`.

## thanks

I was inspired to reorganize and repackage my dotfiles after looking through
[Zack Holman's](https://github.com/holman)
[dotfiles](https://github.com/holman/dotfiles).
My `install.sh` script is a modified copy of Zach's `script/bootstrap`.
This README is also a modified copy.
