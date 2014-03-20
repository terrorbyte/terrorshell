#!/bin/bash

###CONFIG SECTION###
DIR=".config/terrorshell"
THEME="prompt"
MODULES=(gitcheck gitcut banner pkgmngr terrorshell extract security perdir)
###################

###TODO############
#* Add more package managers
#* Github update improvements
#* Improved / Cleaned up alias's
#* Inputrc bind in a seperate config file
#* Update command check for version info and warn that since it doesn't over-wright that they need to change files according to the VERSION file
###################

###Variables###
DATE="$(date +%m-%d)"
EDITOR="vim"

###Set Theme###
. $HOME/$DIR/themes/$THEME

#If no theme set use prompt
if [[ $THEME == "" ]]; then
        THEME="prompt"
fi

###Import completion###
if [[ -e /etc/bash_completion ]]; then
	. /etc/bash_completion
fi

###Bash Settings###
#Shopt Settings
shopt -s autocd #automatically cd
shopt -s extglob #extended matching support
shopt -s checkwinsize #Check window size after each command. Necessary for dynamic themes

#Inputrc Settings#
case "$-" in
        *i*)
          bind 'set completion-ignore-case on' #Autocomplete with ignore case
          bind 'set completion-prefix-display-length 2'
          bind 'set show-all-if-ambiguous on' #List immediately. No stupid bell
          bind 'set show-all-if-unmodified on'
          bind 'set completion-map-case on' #Treat '-' and '_' the same when completing
          bind 'TAB: menu-complete'
          ;;
esac

###Aliases###
#Battery / Monitor / Keyboard
alias bat='upower -d | grep percentage | tr -s [:space:] && upower -d | grep time | tr -s [:space:]' #Use upower to get battery percentage and time left
alias battery='upower -d | grep percentage | tr -s [:space:] && upower -d | grep time | tr -s [:space:]'
alias bright='sudo setpci -s 00:02.0 F4.B=96' #Increase brightness

#Navigation
alias cl='clear' #Alias for clear. Ctrl+l is better though
alias ba='cd -' #Previous directory
alias disk='df -h' #List disk info
alias up='cd ..' #Go up a directory

#Safety features
alias cp='cp -i' #Interactive copy
alias mv='mv -i' #Interactive move
alias rm='rm -I' #Interactive remove
alias ln='ln -i' #Interactive link
alias chown='chown --preserve-root' #Always preserve root
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias ls='ls --color=auto' #Color by default
alias lsa='ls -A --color=auto' #List all with color
alias lsl='ls -la --color=auto' #Long list with color
alias df='df -h' #Human readable disk info
alias du='du -c -h' #Human readable file info
alias mkdir='mkdir -p -v' #Make directory verbose and make parent directories
alias md='mkdir -p' #Make directory with parents
alias rd='rmdir'
alias rmf='rm -rfi' #Interactive recursive remove directory
alias d='dirs -v'

#etc
alias irc='irssi'
alias refresh='bash && kill -SIGKILL $$' #Re-source bashrc (Done this way to reset $PS1 / $PS1_GIT)

###Import Modules###
#Import modules after shopt setting for extglobing and more
for module in "${MODULES[@]}"
do
	. $HOME/$DIR/modules/$module
done
