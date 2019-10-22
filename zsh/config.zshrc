# zsh/config.zshrc

# Default editor.
export EDITOR=vim

# History settings.
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

# end: zsh/config.zshrc
