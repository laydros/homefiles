# The following lines were added by compinstall
zstyle :compinstall filename '/home/laydros/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U promptinit
promptinit

if [ $(hostname) == 'line-6' ]; then
command cowsay -f tux $(fortune -slo)
fi

if [ -n "$DISPLAY" ]; then
    BROWSER=firefox
else
    BROWSER=w3m
fi

export BROWSER

# set default prompt to walters theme
prompt walters

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTFILE=~/.histfile
HISTSIZE=1000
HISTSAVE=1000
setopt appendhistory autocd extendedglob histignorealldups sharehistory nomatch notify correct_all
unsetopt beep

setopt interactivecomments
setopt nohup

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


#### Aliases ####

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

# normal aliases
alias ls='ls --color=auto -F'
alias lsd='ls -ld *(-/DN)'
alias lsa='ls -ld .*'
alias mem="free -m"

# command L equivalent to command |less
# alias -g L='|less'

# command S equivalent to command &> /dev/null &
# alias -g S='&> /dev/null &'

