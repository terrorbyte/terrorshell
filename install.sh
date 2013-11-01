#!/bin/bash
mkdir ~/.terrorshell
#TODO Fix me before pull
#Install to .terrorshell
which git && git clone https://github.com/terrorbyte/bashrc.git ~/.terrorshell && cd ~/.terrorshell && git checkout experimental || {
	echo "Git not found"
	exit
}
if [ -f ~/.bashrc ] || [ -h ~/.bashrc ]; then
  mv ~/.bashrc ~/.bashrc.orig.bak;
fi
cp ~/.terrorshell/templates/.bashrc ~/.bashrc
source ~/.bashrc
