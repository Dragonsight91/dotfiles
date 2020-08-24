###############
### ENVVARS ###
###############

# Path to your oh-my-zsh installation.
export ZSH="/home/${USER}/.oh-my-zsh"

# general user stuff
export ID=92873481236524716398128273 	# some random number
export MAIN_PC=emma@192.168.20.204 		# my main PC's SSH details

# mic loopback script envvars
export LOOPBACK_MIC="alsa_input.pci-0000_00_1f.3.analog-stereo"
export LOOPBACK_OUT="bluez_sink.00_16_94_38_24_8F.a2dp_sink"


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
alias rpi-ssh="ssh -l pi 192.168.20.11"

######################
### General  Setup ###
######################

export DEFAULT_USER=roxanne
clear
neofetch --ascii --ascii_colors 13 13 13 13 13 13 --colors 5 7 7 13 13 7 7

