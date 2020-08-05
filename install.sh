#!/bin/bash
echo "this script will keep all files in this folder and link them where they are needed."
echo "if you delete this folder, the links will break.\n"
echo "this will also assume that all dependencies are installed. (if not, the files will just do nothing."


echo "Getting all submodules... \n"
git submodule update --init --recursive # update and download all submodules

echo "\nCreating ${HOME}/.backup folder for backing up all configs..."
mkdir ~/.backup

echo "backing up Files..."
echo "errors here are normal, if the files haven't been generated. They can be ignored, as they would be replaced anyways."
# back up all files
mv .config/i3 ~/.backup
mv .config/i3status ~/.backup
mv .config/kitty ~/.backup
mv .config/rofi ~/.backup
mv .config/BetterDiscord ~/.backup
mv $HOME/.zshrc ~/.backup
mv $HOME/.nanorc ~/.backup
mv $HOME/.xprofile ~/.backup    
mv $HOME/.fonts/* $PWD/.fonts/  # move all fonte into the central directory



echo "creating directories (in case they don't exist)"
mkdir $HOME/.local $HOME/.local/bin

echo "Linking all files and folders..."
ln -s $PWD/.config/* ~/.config/
ln -s $PWD/.scripts $HOME/.scripts
ln -s $PWD/bin/* $HOME/.local/bin/
ln -s $PWD/.scripts $HOME/
ln -s $PWD/.fonts $HOME/

echo "please add any previous configurations of your .rcfiles and .xprofile again (it has been replaced)"
echo "All files should now have been linked"
echo "Please verify the integrity of all symlinks before restarting (otherwise you may regret it, this script isn't perfect and may fail)"


# reload font cache
fc-cache

