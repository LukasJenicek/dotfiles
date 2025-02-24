# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH="$HOME/.local/share/JetBrains/Toolbox/scripts:$PATH"
export PATH="$HOME/.pulumi/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$ZDOTDIR/ohmyzsh"

export PAGER=less

export HISTFILE="$HOME/.config/.zsh_history"
export HISTFILESIZE=10000
export HISTSIZE=10000

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git golang zsh-autosuggestions zsh-bat zsh-syntax-highlighting kube-ps1 you-should-use asdf docker docker-compose kubectl postgres zoxide)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

source "$HOME/.config/zsh/.zsh_aliases"

# must be after zsh plugin initialization otherwise it gets override
export ASDF_CONFIG_FILE="$HOME/.config/asdf/.asdfrc"
export ASDF_DATA_DIR="$XDG_DATA_HOME/asdf"

. "$ASDF_DATA_DIR/plugins/golang/set-env.zsh"

# replace cd with zoxide
. "$HOME/.config/zsh/.zoxide"
# init zoxide
# see: https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh)"
# init atuin, keep arrow up with default behavior
# see: https://github.com/atuinsh/atuin
eval "$(atuin init zsh --disable-up-arrow)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "/$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

eval "$(direnv hook zsh)"
eval "$(xremap --completions zsh)"
function get_cluster_short() {
  echo "$1" | cut -d - -f1
}

KUBE_PS1_CLUSTER_FUNCTION=get_cluster_short
RPROMPT='$(kube_ps1)'

function pulumi_stack_select {
  if [[ $PWD/ = /home/lj/Projects/Sequence/devops/* ]]; then
    pulumi stack select $1
  else
    echo "pulumi stack select $1 must be run in K8s repo" >&2
  fi
}

function dev {
  kubectl config use-context gke_sequence-gke-dev_us-central1_sequence-b27697b > /dev/null
  kubectl config set-context --current --namespace dev-sequence >/dev/null
  pulumi_stack_select dev
}

function dev2 {
  kubectl config use-context gke_sequence-gke-dev_us-central1_sequence-b27697b > /dev/null
  kubectl config set-context --current --namespace dev2-sequence >/dev/null
# pulumi_stack_select dev2
}

function stg {
  kubectl config use-context gke_sequence-gke-stg_us-central1_sequence-1c76c89 > /dev/null
  kubectl config set-context --current --namespace stg-sequence >/dev/null
# pulumi_stack_select stg
}

function next {
  kubectl config use-context gke_sequence-gke-stg_us-central1_sequence-1c76c89 > /dev/null
  kubectl config set-context --current --namespace next-sequence >/dev/null
# pulumi_stack_select next
}

function prod {
  kubectl config use-context gke_sequence-gke-prod_us-central1_sequence-ceb2b44 > /dev/null
  kubectl config set-context --current --namespace prod-sequence >/dev/null
  pulumi_stack_select prod
}
