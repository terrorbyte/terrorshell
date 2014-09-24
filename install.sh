#!/bin/bash
echo "Creating ~/.config/terrorshell directory..."
mkdir -p ~/.config/terrorshell
#TODO Fix me before pull
#Install to ~/.config/terrorshell
echo "Cloning github repo..."
command -v git &> /dev/null && git clone https://github.com/terrorbyte/terrorshell.git ~/.config/terrorshell && cd ~/.config/terrorshell && git checkout || {
	echo "Git not found"
	exit
}
echo -e "Backing up old bashrc to ~/.config/terrorshell/modules/bashrc.orig...\nSee this file for more information on modules"
if [ -f ~/.bashrc ] || [ -h ~/.bashrc ]; then
    touch ~/.config/terrorshell/modules/userbashrc
    cat ~/.config/terrorshell/instructions > ~.config/terrorshell/modules/bashrc.orig
    cat ~.bashrc >> ~/.config/terrorshell/modules/bashrc.orig
    rm ~/.bashrc 
fi
echo "Replacing .bashrc..."
cp ~/.config/terrorshell/templates/bashrc ~/.bashrc
echo "You should never need to use the install script again"
echo -e "Simply use the command 'terrorshell update'\nSee 'terrorshell help' for other options\n\n"
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
