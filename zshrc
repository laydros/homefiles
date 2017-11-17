# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

#export CVSROOT=:pserver:jasonh@dagr:/home/cvsroot/wycom
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="kphoen"
ZSH_THEME="jreese"
#ZSH_THEME="bira"

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
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(colorize osx sublime brew zsh-syntax-highlighting pip emacs colored-man git)

# User configuration

export PATH="$HOME/bin:$HOME/code/venvs/bin:/usr/local/opt/python/libexec/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/m3db/data/linux/bin:$HOME/.local/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# enable shims and autocompletion for pyenv
# if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# always use emacs style keybindings with zle
bindkey -e

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias l="clear && pwd && ls -FGl"
alias u="cd .. && l"
alias ..="cd .."
alias ...="cd ..."
# the "kp" alias ("que pasa")
alias kp="ps auxwww"
#alias dt="cd ~/Desktop/"
#alias e=emacsclient -t
#alias ec=emacsclient -c

#alias todo="emacs -batch -l ~/.emacs.d/init.el -eval '(org-batch-agenda \"t\")' 2> /dev/null "
#alias today="emacs -batch -l ~/.emacs.d/init.el -eval '(org-batch-agenda \"a\")' 2> /dev/null "

# global alias
alias -g gp=' | grep -i'

# Auto extension
#alias -s html=$BROWSER
#alias -s com=$BROWSER
#alias -s net=$BROWSER
#alias -s png=feh
#alias -s jpg=feh
#alias -s gif=feh
#alias -s java=$EDITOR
#alias -s txt=$EDITOR
#alias -s PKGBUILD=$EDITOR

cl() {
    cd "$1" && ls
}

mc() {
    mkdir -p "$1" && cd "$1"
}

idata() {
    (head -n 5; tail -n 5) < "$1" | column -t
}

# set term type that will work most places
export TERM=xterm

# for tmux: export 256color
#[ -n "$TMUX" ] && export TERM=screen-256color

# use vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
