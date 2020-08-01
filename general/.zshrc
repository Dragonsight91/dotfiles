# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/${USER}/.oh-my-zsh"
export ID=92873481236524716398128273
export MAIN_PC=emma@192.168.20.204
ZSH_THEME="agnoster"


######################
### PLUGIN LOADING ###
######################
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
[[ -s /home/$USER/.autojump/etc/profile.d/autojump.sh ]] && source /home/$USER/.autojump/etc/profile.d/autojump.sh
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

export DEFAULT_USER=emma
clear
neofetch --ascii --ascii_colors 13 13 13 13 13 13 --colors 5 7 7 13 13 7 7

