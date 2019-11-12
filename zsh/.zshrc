#!/bin/zsh

export HOME_ZSHRC="$HOME/.zshrc"

if [ -L $HOME_ZSHRC ]; then
    zshrcloc=$(dirname $(readlink -f $HOME_ZSHRC));
else
    zshrcloc=$(dirname $HOME_ZSHRC);
fi;

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.yarn/bin" ] ; then
    PATH="$HOME/.yarn/bin:$PATH"
fi

if [ -d "$HOME/.sdkman/bin" ] ; then
    PATH="$HOME/.sdkman/bin:$PATH"
fi

if [ -d "/usr/local/go/bin" ] ; then
    PATH="/usr/local/go/bin:$PATH"
fi

if [ -d "$(go env GOPATH)/bin" ] ; then
    PATH="$(go env GOPATH)/bin:$PATH"
fi

if [ -d "/usr/local/maven/bin" ] ; then
    PATH="/usr/local/maven/bin:$PATH"
fi

if [ -d "/snap/bin" ] ; then
    PATH="/snap/bin:$PATH"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export PATH=$PATH
export JDK_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# The agnoster theme requires patched fonts - use the following line to do so:
# sudo apt-get install fonts-powerline
# You will have to restart the terminal..
ZSH_THEME="agnoster"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$zshrcloc/zsh_custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    z
    golang
    web-search
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Makes sure bat works well with less's mouse signal scrolling
export BAT_PAGER="less -S"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vi'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/nitzan/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/home/nitzan/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/nitzan/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/nitzan/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# additional git aliases
alias glon='glola --author-date-order'
alias gg="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all --author-date-order"
alias gpump='git push --set-upstream git@gitlab.com:nitzan.zada/$(git rev-parse --show-toplevel | xargs basename).git $(git rev-parse --abbrev-ref HEAD) && git remote add origin git@gitlab.com:nitzan.zada/$(git rev-parse --show-toplevel | xargs basename).git && git fetch --all'

# bookmarks
alias ttom='open_command https://trello.com/b/SbyBrJxQ'
alias tid='open_command https://trello.com/b/tZaiZ8ln/ideas'

# misc aliases
alias untargz='tar xzvf'
alias whoport='sudo lsof -i -P -n | grep LISTEN'
alias xo=open_command
alias btt=bat
alias bt='bat --paging=never'
alias pls=sudo
alias wch='watch -n 1'
alias hig='history | grep'
alias gitnitz='git config user.email "nitzan.zada@gmail.com" && git config user.name "Nitzan Zada"'
alias gomtm='git fetch . origin/master:master'
alias ynk='yank-cli -- xsel -b'
alias ynkk=yank-cli
alias l='exa --time-style iso -la --git --group-directories-first --icons'
alias ls='exa --time-style iso -a --git --group-directories-first --icons'
alias tk=taskell
# alias life='taskell ~/Dropbox/life.md'
alias life='taskell /keybase/private/mastern2k3/notes/life.md'
alias tmux='tmux -u'
alias vi='nvim'
alias rmr='rm -r'

function cht() {
    curl cht.sh/$1
}

neofetch
