# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"
#ZSH_THEME="af-magic"

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
#alias vim=emacsclient -t

alias todo="emacs -batch -l ~/.emacs.d/init.el -eval '(org-batch-agenda \"t\")' 2> /dev/null "
alias today="emacs -batch -l ~/.emacs.d/init.el -eval '(org-batch-agenda \"a\")' 2> /dev/null "

# Auto extension
alias -s html=$BROWSER
alias -s com=$BROWSER
alias -s net=$BROWSER
alias -s png=feh
alias -s jpg=feh
alias -s gif=feh
alias -s java=$EDITOR
alias -s txt=$EDITOR
alias -s PKGBUILD=$EDITOR

# junk for st terminal
function zle-line-init () { echoti smkx }
function zle-line-finish () { echoti rmkx }
zle -N zle-line-init
zle -N zle-line-finish

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

cl() {
    cd "$1" && ls
}

mc() {
    mkdir -p "$1" && cd "$1"
}

idata() {
    (head -n 5; tail -n 5) < "$1" | column -t
}

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# set emacs as default editor
export EDITOR='ec'
#bindkey -v

# set Sublime Text as default editor
#export EDITOR='subl'
#bindkey -v

# set term type that will work most places
export TERM=xterm

# for tmux: export 256color
#[ -n "$TMUX" ] && export TERM=screen-256color

# use vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# lastpass config directory
export LPASS_HOME=~/.config/lpass

# Customize to your needs...
export PATH=~/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/X11/bin:/usr/games:/home/m3db/data/linux/bin
