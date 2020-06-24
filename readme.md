# Dragonsight91's Dotfiles

The fonts used here sre not mine, but they are freely Available.

## Dependencies

| Name            |           description         |
|-----------------|-------------------------------|
| `curl`          | command line tool and library for transferring data with URLs. |
| `i3-gaps`       | The Window Manager |
| `i3status`      | gives status info on i3bar |
| `feh`           | an application that sets the background image |
| `kitty`         | A nice looking Terminal |
| `rofi`          | A dmenu that is better than the default i3 dmenu |
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
    sudo yay -S curl i3-gaps i3status kitty rofi python xss-lock picom feh zsh i3lock-color discord

    # install betterdiscord
    curl -O https://raw.githubusercontent.com/bb010g/betterdiscordctl/master/betterdiscordctl
    chmod +x betterdiscordctl
    sudo mv betterdiscordctl /usr/local/bin
    betterdiscordctl install

    #install oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    # install autojump
    git clone git://github.com/wting/autojump.git
    cd autojump
    ./install.py or ./uninstall.py



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



### window controls
- <kbd>Super + {ARROW}</kbd> - focus window 
- <kbd>Super + Shift + {ARROW}</kbd> - move window 
- <kbd>Super + Alt + {ARROW}</kbd> - resize window
- <kbd>Super + Shift + Q</kbd> - kill focused window
- <kbd>Super + F</kbd> - toggle fullscreen
- <kbd>Super + T</kbd> - toggle tabbed layout