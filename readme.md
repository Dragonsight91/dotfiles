# Dragonsight91's Dotfiles
This is the repository and a manual on how to replicate my exact setup.
The fonts used here sre not mine, but they are freely Available.

## Dependencies

| Name            |           description         |
|-----------------|-------------------------------|
| `git`           | you want the dotfiles, right? easiest way to get it is git|
| `curl`          | command line tool and library for transferring data with URLs. |
| `i3-gaps`       | The Window Manager |
| `i3status`      | gives status info on i3bar |
| `nemo`          | The file manager i use |
| `feh`           | an application that sets the background image |
| `nomacs`        | An image viewer that also has basic editing features|
| `kitty`         | A nice looking Terminal |
| `rofi`          | A dmenu that is better than the default i3 dmenu |
| `playerctl`     | gives cli controls for music players as well as metadata output |
| `python`        | the Python Language Interpreter |
| `xss-lock`      | a tool that automatically locks the screen on inactivity |
| `i3lock-color`  | a better version of i3lock, a screen locker |
| `picom`         | Extra compositor that enables transparency in the terminal  |
| `betterdiscord` | enables discord themes |
| `discord`       | i don't think this needs an introduction|
| `zsh`           | a nicer looking shell with extra functions |
| `oh-my-zsh`     | an even better way to theme zsh |
| `zsh-autojump`  | a plugin that allows using `j [Dirname]` to jump to any directory, as long as you previously visited that directory (say i'm in `/` and i wanna get to `/home/$USER/Documents`, just type `j Doc` and it jumps there.)
| `k` | A plugin for zsh that makes the ls look better

## Setup

1. Download & install all dependencies

    ```bash

    # install normal packages available on a package manager
    # here: pacman, replace "pacman -S" with your equivalent, like "apt-get install"
    sudo pacman -S curl i3-gaps i3status kitty rofi python xss-lock picom feh zsh i3lock-color discord git nemo nomacs xbindkeys xdotool playerctl

    # install betterdiscord
    curl -O https://raw.githubusercontent.com/bb010g/betterdiscordctl/master/betterdiscordctl
    chmod +x betterdiscordctl
    sudo mv betterdiscordctl /usr/local/bin
    betterdiscordctl install

    #install oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    # install autojump plugin
    git clone git://github.com/wting/autojump.git
    cd autojump
    ./install.py

    # install k plugin
    git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k

    ```

2. backup original files

    ```bash
    # cheaply copy everything that may be replaced by these files
    mkdir ~/.backup
    cp ~/.config/* ~/.backup
    cp ~/.xprofile ~/.backup
    cp ~/.zshrc ~/.backup
    ```

3. install the dotfiles

    There are a few directories in this repo:

    - `.config` has files that you should put into `~/.config/*`
    - `.scripts` has files that you should put into `~/.scripts` (create if it doesn't exist)
    - `.fonts` has additional fonts that you should install into `~/.fonts`
    - `general` has some files that are to be installed into `~/`
    - `bin` has files to be installed into `~/.local/bin`

    How to install the files?

    ```bash
    # remove all files & folders that we will replace (please follow step 1 first...)
    rm -rf ~/.config/BetterDiscord ~/.config/i3 ~/.config/i3status ~/.config/kitty ~/.config/rofi
    rm ~/.zshrc ~/.xprofile

    # clone and move into the repo:
    git clone https://github.com/Dragonsight91/dotfiles.git
    cd dotfiles

    # make directories that may not exist
    mkdir ~/.scripts
    mkdir ~/.local/bin

    # move all the files
    cp -r .config/* ~/.config/
    cp -r .fonts/* ~/.fonts/
    cp -r bin/* ~/.local/bin/
    cp -r general/* ~/

    # install the grub theme
    # if you wanna install the grub theme, you will have to edit 
    # /etc/default/grub and set
    # GRUB_THEME="/boot/grub/themes/grub-cyberpunk/theme.txt"
    sudo nano /etc/default/grub

    # now just run the install script
    sudo ./grub-theme/install.sh

    ```

## Shortcuts

The main modifier used is <kbd>Super</kbd>. this can be changed on the top of the i3 config, by setting `$mod_main`.
**WARNING** if you set `$mod_main` to <kbd>Alt</kbd>, you have to change the modifier for `$alt` as well.

### General controls

- <kbd>Super + L</kbd> - spawn i3-lock
- <kbd>Super + D</kbd> - spawn rofi
- <kbd>Super + Enter</kbd> - start Kitty
- <kbd>Super + {NUMBER}</kbd> - Switch to workspace
- <kbd>Super + Shift +{NUMBER}</kbd> - move focused window to workspace
- <kbd>Super + +</kbd> - Switch to video workspace
- <kbd>Super + Tab</kbd> - Switch to next open workspace
- <kbd>Super + Shift + Tab</kbd> - Switch to previous open workspace
- <kbd>Super + Shift + +</kbd> - move focused window to video workspace
- <kbd>Super + Shift + Esc</kbd> - Log out
- <kbd>Super + Shift + C</kbd> - reload i3 config
- <kbd>Super + Shift + R</kbd> - restart i3 in place

### Media controls (needs `playerctl` package)

- Play/pause and volume control works woith media keys
- <kbd>Super + P</kbd> - Play/Pause
- <kbd>Super + PgUp</kbd> - Next song
- <kbd>Super + PgDn</kbd> - restart i3 in place

### window controls

- <kbd>Super + {ARROW}</kbd> - focus window 
- <kbd>Super + Shift + {ARROW}</kbd> - move window 
- <kbd>Super + Alt + {ARROW}</kbd> - resize window
- <kbd>Super + Shift + Q</kbd> - kill focused window
- <kbd>Super + F</kbd> - toggle fullscreen
- <kbd>Super + T</kbd> - toggle tabbed layout

## How does this work?

Everything works based on the i3 workspaces. All the programs i use are assigned to a workspace. In workspaces where i have multiple windows, i switch to tabbed layout.
This way you can easily use the space efficiently. When i have more than one monitor, i assign workspaces to monitors, making this compatible with both multhihead setups as well as laptop Setups (i use it on both).

### The Window bindings
This is a list of all applications and workspaces and where you can expect things to go. Apart from the Video workspace (which uses <kbd>Super + +</kbd> to switch), you can expect these numbers to be the actual number used to swoitch to that workspace.

0. **Misc**
    
    This workspace is mostly for settings and config applications
    - pavucontrol
    - barrier
    - blueberry
    - modem-manager-gui

1. **Browser**

    As the name suggests, this workspace gets all the browser action.
    - Firefox
    - Tor Browser
2. **Editor**

    This workspace holds all the editors i need for projects. 
    - vscode
    - Unreal Engine 4 Editor
3. **Chat**

    This workspace is for all the social media and communication stuff
    - Telegram Desktop
    - Discord
    - Zoom
4. **Terminal**

    Any terminal goes here. Why? it's transparent and i really hate floating windows 
    - Kitty
    - urxvt
5. **Games**
    
    All the gaming stuff, will later bind more things, like lutris.
    - Steam
    - Minecraft
6. Image

    All the image viewing and editing stuff. Since i don't have a better program than gimp, that's all i have inediting.
    - Gimp
    - nomacs
7. **Util**

    All the utilitiesthat i occasionally use. this is kept seperate from image and video, because these are more general utilities which also don't like running in half-width windows.
    - Virtual Box
    - obs
    - Filezilla
    - Wireshark
8. Music

    All the music playing and audio editing things. may also include 
    - Spotify
    - Audacity
9. Email

    Emails, that's it. just thunderbird. but i don't like thunderbird being half-width.
    - Thunderbird
10. **Video**
    
    This is a special workspace for video editing and playback software.
    This is the only workspace that doesn't use any number, but <kbd>+</kbd> as its identifier.
    - vlc
    - mpv
    - shotcut
    - kdenlive
    - blender