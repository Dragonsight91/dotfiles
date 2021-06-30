###############
### ENVVARS ###
###############

# Path to your oh-my-zsh installation.
export ZSH="/usr/share/oh-my-zsh"

# general user stuff
export ID=92873481236524716398128273 	# some random number
export MAIN_PC=emma@192.168.20.204 		# my main PC's SSH details
export PI=192.168.1.99                  # raspberry pi local ip
# mic loopback script envvars
export LOOPBACK_MIC="alsa_input.pci-0000_00_1f.3.analog-stereo"
export LOOPBACK_OUT="bluez_sink.00_16_94_38_24_8F.a2dp_sink"

# env stuff
export EDITOR="nano"
export NPM_PACKAGES="${HOME}/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH="$NPM_PACKAGES/bin:$HOME/bin:$HOME/.local/bin:$HOME/.dotnet/tools:$PATH"

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
	k
	zsh-syntax-highlighting
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
source ~/.zshsecret
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
alias weather='curl wttr.in/houten\?qmM1'

######################
### General  Setup ###
######################

export DEFAULT_USER=emma
clear

if [[ "${TERM}" = "xterm-256color" ]];
then
    neofetch --ascii
else
    neofetch
fi

