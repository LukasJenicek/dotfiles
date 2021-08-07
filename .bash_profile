# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{aliases,functions,"git-completion.bash"}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

__git_complete g __git_main

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;
# append to the history file, don't overwrite it
shopt -s histappend
# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
# Save 2,000,000 lines of history to disk (will have to grep ~/.bash_history for full listing)
HISTFILESIZE=2000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[38;5;226m\]\u:\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

eval "$(direnv hook bash)"
