#!/bin/bash
echo "this script will keep all files in this folder and link them where they are needed."
echo "if you delete this folder, the links will break.\n"
echo "this will also assume that all dependencies are installed. (if not, the files will just do nothing."


echo "Getting all submodules... \n"
git submodule update --init --recursive # update and download all submodules

echo "\nCreating ${HOME}/.backup folder for backing up all configs..."
mkdir $HOME/.backup

echo "backing up Files..."
echo "errors here are normal, if the files haven't been generated. They can be ignored, as they would be replaced anyways."

# back up all files
mv $HOME/.config/i3 $HOME/.backup
mv $HOME/.config/i3status $HOME/.backup
mv $HOME/.config/kitty $HOME/.backup
mv $HOME/.config/rofi $HOME/.backup
mv $HOME/.config/BetterDiscord $HOME/.backup
mv $HOME/.zshrc $HOME/.backup
mv $HOME/.nanorc $HOME/.backup
mv $HOME/.xprofile $HOME/.backup    
mv $HOME/.fonts/* $HOME/.fonts/  # move all fonts into the central directory
rm -r $HOME/.fonts               # remove fontdir



echo "creating directories (in case they don't exist)"
mkdir $HOME/.local $HOME/.local/bin $HOME/.config

echo "Linking all files and folders..."

# link all folders in .config
for i in $(ls $PWD/.config/); 
do
    ln -s $PWD/.config/$i $HOME/.config/$i
done;
for i in $(ls $PWD/bin/); 
do
    ln -s $PWD/.config/$i $HOME/.local/bin/$i
done;
for i in $(ls -a $PWD/general/.*); 
do
    ln -s $PWD/general/$i $HOME/$i
done;

ln -s $PWD/.scripts $HOME/.scripts
ln -s $PWD/.fonts $HOME/


echo "please add any previous configurations of your .rcfiles and .xprofile again (it has been replaced)"
echo "All files should now have been linked"
echo "Please verify the integrity of all symlinks before restarting (otherwise you may regret it, this script isn't perfect and may fail)"


# reload font cache
fc-cache