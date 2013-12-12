#!/bin/bash
# Author: alpha-san
# OS: Ubuntu 13.10+
# Hardware: Thinkpad X120e
# To Make Executable: chmod u+x
echo "Install script for Ubuntu on Thinkpad X120e"

# repositories, programs, drivers
# edit as you see fit
# repositories in their order: dark theme, sublime text 3, and flux
repos=( "noobslab/themes" "webupd8team/sublime-text-3" "kilian/f.lux" )
drivers=( "gpointing-device-settings" )
programs=( "vim" "eclipse" "g++" "chromium-browser" "delorean-dark" "bleachbit"
"synaptic" "dropbox" "filezilla" "keepass2" "sublime-text-installer" "weechat"
"fluxgui" )
space=' '

# move bash_aliases file and vimrc file
sudo cp .vimrc ~/.vimrc
sudo cp .bash_aliases ~/.bash_aliases

# install necessary repoitories
for i in "${repos[@]}"
do
    :
    sudo add-apt-repository ppa:$i
done
#sudo add-apt-repository ppa:noobslab/themes

# update list of software
sudo apt-get update

# install software
programs_list=' '
for i in "${programs[@]}"
do
    :
    programs_list=$programs_list_space$i
done
sudo apt-get install $programs_list

# install drivers
drivers_list=' '
for i in "${drivers[@]}"
do
    :
    drivers_list=$drivers_list$space$i
done
sudo apt-get install $drivers_list

# upgrade software
sudo apt-get upgrade

# display what else needs to be fixed
echo "THINGS TO DO:"
echo "- Change CapsLock -> Control (In TweakTools > Typing > Ctrl key position)"
echo "- Change theme manually"
echo "- Add the minimize button"
echo "- Change fonts to Sawasdee, Aurulent Sans, and monofur"
echo "- Add dropdown terminal\n"
echo "HARDWARE-SPECIFIC THINGS TO DO:"
echo "- Add vertical scrolling for touchpad in 'Pointing Devices'"
echo "- Install drivers for AMD GPU"
echo "- Turn off bluetooth at startup
(http://askubuntu.com/questions/67758/how-can-i-deactivate-bluetooth-on-system-startup)
"
cd ~
exec bash						                        # restart  bash
