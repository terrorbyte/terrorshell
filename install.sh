#!/bin/bash
mkdir ~/.terrorshell
which git && git clone https://github.com/terrorbyte/bashrc.git ~/.terrorshell || {
	echo "Git not found"
	exit
}
if [ -f ~/.bashrc ] || [ -h ~/.bashrc ]; then
#echo "\033[0;33mFound ~/.bashrc.\033[0m \033[0;32mBacking up to ~/.bashrc.orig.bak\033[0m";
  mv ~/.bashrc ~/.bashrc.orig.bak;
fi
cp ~/.terrorshell/templates/.bashrc ~/.bashrc
source ~/.bashrc
