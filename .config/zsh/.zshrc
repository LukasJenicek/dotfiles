# History
source $HOME/.config/shell/profile

HISTFILE="$HOME/.config/.local/history/.histfile"
HISTSIZE=9000
SAVEHIST=9000
setopt hist_ignore_space       # ignore commands that start with space
setopt hist_ignore_all_dups    # ignore duplicated commands history list
setopt hist_verify             # show command with history expansion

bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstal
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
autoload -Uz vcs_info
precmd() { vcs_info }

compinit

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '
