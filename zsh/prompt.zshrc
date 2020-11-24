# zsh/prompt.zshrc

# note: line break is on purpose
#PS1="
#%n@%m %~ 
#%# "

autoload -U colors && colors
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats "(%{$fg[green]%}%b %m%u%c%{$reset_color%}) "
# note: line break is on purpose
PROMPT='
%n@%m %~ $vcs_info_msg_0_
%# '

# end: zsh/prompt.zshrc
