#!/bin/bash
echo "Creating ~/.config/terrorshell directory..."
mkdir -p ~/.config/terrorshell
#TODO Fix me before pull
#Install to ~/.config/terrorshell
echo "Cloning github repo..."
command -v git &> /dev/null && git clone https://github.com/terrorbyte/bashrc.git ~/.config/terrorshell && cd ~/.config/terrorshell && git checkout || {
	echo "Git not found"
	exit
}
echo "Backing up old bashrc to ~/.bashrc.orig..."
if [ -f ~/.bashrc ] || [ -h ~/.bashrc ]; then
  mv ~/.bashrc ~/.bashrc.orig;
fi
echo "Replacing .bashrc..."
cp ~/.config/terrorshell/templates/bashrc ~/.bashrc
echo "Welcome to a real shell:"
echo "
___________                               _________.__           .__  .__   
\__    ___/_________________  ___________/   _____/|  |__   ____ |  | |  |  
  |    |_/ __ \_  __ \_  __ \/  _ \_  __ \_____  \ |  |  \_/ __ \|  | |  |  
  |    |\  ___/|  | \/|  | \(  <_> )  | \/        \|   Y  \  ___/|  |_|  |__
  |____| \___  >__|   |__|   \____/|__| /_______  /|___|  /\___  >____/____/
             \/                                 \/      \/     \/           
"
bash && kill -SIGKILL $$
