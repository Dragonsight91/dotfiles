# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/.local/bin:/usr/local/bin:$PATH

###############
### ENVVARS ###
###############

# Path to your oh-my-zsh installation.
export ZSH="/home/${USER}/.oh-my-zsh"

# mic loopback script envvars
export LOOPBACK_MIC="alsa_input.pci-0000_00_1f.3.analog-stereo"
export LOOPBACK_OUT="bluez_sink.00_16_94_38_24_8F.a2dp_sink"

# screen names
export SCREEN_LEFT="DVI-2-1"
export SCREEN_RIGHT="DVI-2-0"
export SCREEN_CENTER="DVI-D-0"

#screen modes
export SCREEN_LEFT_MODE="1920x1080"
export SCREEN_RIGHT_MODE="1024x768"
export SCREEN_CENTER_MODE=$SCREEN_LEFT_MODE

# custom gtk crap
export GTK_IM_MODULE=xim

######################
### PLUGIN LOADING ###
######################
ZSH_THEME="agnoster"

plugins=(
    git
	colorize
	colored-man-pages
	ng
	npm
	pip
	python
	urltools
	autojump
	zsh-syntax-highlighting
	k
)

source $ZSH/oh-my-zsh.sh

# load autojump
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# Compilation flags
export ARCHFLAGS="-arch x86_64"

#########################
### INPUT DEFINITIONS ###
#########################

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^H' backward-kill-word
bindkey '5^' kill-word

###################
###   ALIASES   ###
###################

###  zsh aliases
alias zsh-reload="source ~/.zshrc"
alias zsh-conf="code ~/.zshrc"

### wm config stuff
alias i3-conf="code ~/.config/i3/"
alias kitty-conf="code ~/.config/kitty"
alias rofi-conf="code ~/.config/rofi"

### fun
alias poweroof="poweroff"
alias fml="poweroff"
alias nani="echo 'おまえ は もう しんでいる';echo '何？'"

### general aliases
alias sudo="sudo "
alias spotify-adblock="LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify"
alias zip="zip -r "
alias rpi-ssh="ssh -l emma -p 1337 89.190.141.162"

######################
### General  Setup ###
######################

# envvars
export DEFAULT_USER=emma

# shell reset
clear
neofetch --ascii --ascii_colors 13 13 13 13 13 13 --colors 5 7 7 13 13 7 7

