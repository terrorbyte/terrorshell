#!/bin/bash

###EDIT THESE###
#export TERM=linux
NAME=""
EMAIL=""
#For tun alias (Remote computer to ssh into)
TUNUSER=""
TUNSRV=""
#Note sync settings
#Full path of local computer
FROMFOLDER=""
#Full path of remote computer
TOFOLDER=""
#Server #INCLUDE USER#
NOTESSRV=""


#if [[ $NAME == ""  ]] then;
#	echo "Enter your name: "
#fi
#
#if [[ $EMAIL == "" ]] then;
#	echo "Enter your e-mail: "
#fi

#For testing
UNICODECHAR1="[☣]"
UNICODECHAR2="[∴]"

DEBEMAIL="$EMAIL"
DEBFULLNAME="$NAME"
export DEBEMAIL DEBFULLNAME

###COLORS###
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
bakgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

#Get package manager
# Debian, Ubuntu and derivatives (with apt-get)
#PKGMNGR=""
if [[ ! -e ~/.pkgmngr ]]; then
	echo "###################"
	echo "First time setup..."
	echo "###################"
	echo -e "$txtred NOTE: Please edit ~/.bashrc if you want to get full functinality from this bash configuration$txtrst"
	echo "Run 'alias' to view the aliases loaded at any time."
	if which apt-get &> /dev/null; then
       		echo "PKGMNGR='apt-get'" > ~/.pkgmngr 	
		#apt-get install $PKGSTOINSTALL
        # OpenSuse (with zypper)
	elif which zypper &> /dev/null; then
		echo "PKGMNGR='zypper'" > ~/.pkgmngr
		#"zypper in $PKGSTOINSTALL"
        # Mandriva (with urpmi)
	elif which urpmi &> /dev/null; then
      		echo "PKGMNGR='urmpi'" > ~/.pkgmngr
		#urpmi $PKGSTOINSTALL
        # Fedora and CentOS (with yum)
	elif which yum &> /dev/null; then
      		echo "PKGMNGR='yum'" > ~/.pkgmngr
		#yum install $PKGSTOINSTALL
        # ArchLinux (with pacman)
	elif which pacman &> /dev/null; then
       		echo "PKGMNGR='pacman'" > ~/.pkgmngr
		#pacman -Sy $PKGSTOINSTALL
        # Else, if no package manager has been found
	else
        # Set $NOPKGMANAGER
		echo "PKGMNGR=''" > ~/.pkgmngr
		. ~/.pkgmngr
		if [[ $PKGMNGR == '' ]]; then
			echo "ERROR 1: No package manager found. Please, manually add these settings into ~/.pkgmngr"
		fi
fi
	echo -e "$txtred In order for the package manager aliases to work properly you must also make this script root's .bashrc"
	#TODO 
else
	. ~/.pkgmngr
fi

if [[ $PKGMNGR = 'apt-get' ]]; then
	INSTALLCMD="sudo $PKGMNGR install"
	UPDATECMD="sudo $PKGMNGR update && sudo $PKGMNGR upgrade && sudo $PKGMNGR dist-upgrade && sudo $PKGMNGR clean"
	UPDATEMIRRORCMD="sudo $PKGMNGR update"
	REMOVECMD="sudo $PKGMNGR remove"
elif [[ $PKGMNGR = 'zypper' ]]; then
	INSTALLCMD='$PKGMNGR in'
	UPDATECMD='$PKGMNGR up'
	UPDATEMIRRORCMD='$PKGMNGR ref'
	REMOVECMD='$PKGMNGR remove'
elif [[ $PKGMNGR = 'urmpi' ]]; then
	INSTALLCMD='$PKGMNGR' 
        UPDATECMD='$PKGMNGR.update -a'
        UPDATEMIRRORCMD='$UPDATECMD && echo "Cannot just update mirrors with urmpi"'
        REMOVECMD='urpme'
elif [[ $PKGMNGR = 'yum'  ]]; then
	INSTALLCMD='$PKGMNGR install'
        UPDATECMD='$PKGMNGR update'
        UPDATEMIRRORCMD='$PKGMNGR update && echo "Cannot just update mirrors with yum"'
        REMOVECMD='$PKGMNGR remove'
elif [[ $PKGMNGR = 'pacman' ]]; then
	INSTALLCMD='$PKGMNGR -Sy' 
        UPDATECMD='$PKGMNGR -Syu'
        UPDATEMIRRORCMD='$PKGMNGR -Syy'
        REMOVECMD='$PKGMNGR -Rs'
else
	if [[ ! -e ~/.pkgmngr ]]; then
		echo "ERROR 2: No package manager found. Please, manually add these settings into ~/.pkgmngr"
	fi
fi

###PS1
#PS1="\n\[\033[1;37m\]\342\224\214($(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;34m\]\u@\h'; fi)\[\033[1;37m\])\342\224\200(\[\033[1;34m\]\$?\[\033[1;37m\])\342\224\200(\[\033[1;34m\]\@ \d\[\033[1;37m\])\[\033[1;37m\]\n\342\224\224\342\224\200(\[\033[1;32m\]\w\[\033[1;37m\])\342\224\200(\[\033[1;32m\]\$(ls -1 | wc -l | sed 's: ::g') files, \$(ls -lah | grep -m 1 total | sed 's/total //')b\[\033[1;37m\])\342\224\200> \[\033[0m\]"
#PS1="$(if [[ ${EUID} == 0 ]]; then echo '\e[0;31m\h'; else echo '\e[0m\u'; fi)$txtrst\342\224\200[$txtcyn\w$txtrst]\342\224\200$bldylw$UNICODECHAR1\342\224\200> $txtrst"
#PS1="$(if [[ ${EUID} == 0 ]]; then echo '\e[0;31m\h'; else echo '\e[0m\u'; fi)$txtrst-[$txtcyn\w$txtrst]-$txtred $($(while sleep .3; do i=$((++i%4 + 2)); printf '\b|/-\' | cut -b 1,$i | tr -d '\012'; done) &)> $txtrst"
#PS1="$(if [[ ${EUID} == 0 ]]; then echo '\e[0;31m\h'; else echo '\e[0m\u'; fi)$txtrst\342\224\200[$txtcyn\w$txtrst]\342\224\200$bldylw$UNICODECHAR1\342\224\200> $txtrst"
#PS1="$(if [[ ${EUID} == 0 ]]; then echo '\e[0;31m\h'; else echo '\e[0m\u'; fi)$txtrst\342\224\200[$txtcyn\w$txtrst]\342\224\200$bldylw> $txtrst"
#PS1="[☣]-$bldylw>$txtrst "
PS1="$(if [[ ${EUID} == 0 ]]; then echo '\h'; else echo '\u'; fi)\342\224\200[\w]\342\224\200> "

###Imports###
. /etc/bash_completion

###Output Standardizing###
#trap 'echo -ne "\e[0m"' DEBUG

###Shopt Settings###
shopt -s autocd
shopt -s extglob
#shopt -s checkwinsize

#Aliases
#Battery / Monitor / Keyboard
alias bat='upower -d | grep percentage && upower -d | grep time'
alias battery='upower -d | grep percentage && upower -d | grep time'
alias bright='sudo setpci -s 00:02.0 F4.B=96'
alias kb='setxkbmap -option grp:alt_shift_toggle us,dvorak'

#Navigation
alias cl='clear'
alias ba='cd -'
alias disk='df'
alias up='cd ..'
alias rmf='rm -rfi'
# safety features
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias ls='ls --color=auto'
alias lsa='ls -a --color=auto'
alias lsl='ls -la --color=auto'
alias attach='tmux attach'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias openports='ss --all --numeric --processes --ipv4 --ipv6'

#alias mail='ssmtp'
#Remote and Sync
#UNFINISHED
alias notes-from='rsync -avz -e "ssh" $NOTESSRV:FROMFOLDER $TOFOLDER'
alias notes-to='rsync -avz -e "ssh" $TOFOLDER $NOTESSRV:$FROMFOLDER'

alias rfs='sshfs'
alias tun='pkill firefox & sleep 2s && firefox -P tunnel & ssh -D 1331 $TUNUSER@$TUNSRV'
alias ip='curl -s http://checkip.dyndns.org/ | grep -o '[0-9][0-9]*.[0-9][0-9]*.[0-9][0-9]*.[0-9]*''
alias calendar='google calendar'
alias reminder='google calendar --reminder'
alias irc='irssi'
alias links='links google.com'

#Requires a profile called tunnel that has proxy settings (socks5) set

#Encryption / GPG
alias enc='echo "Enter file name to encrypt:" && read -e ENCFILE && openssl aes-256-cbc -a -salt -in $ENCFILE -out $ENCFILE.enc && echo "File $ENCFILE is encrypted to $ENCFILE.enc" && ENCFILE=""'
alias dec='echo "Enter file name to decrypt:" && read -e DECFILE && openssl aes-256-cbc -d -a -in $DECFILE -out $DECFILE.new && echo "File $DECFILE is decrypted to $DECFILE.new" && DECFILE=""'
alias gpgbackup='DAY=$(date +"%m-%d") && tar -zcvf $DAY.tar.gz .gnupg/ && openssl aes-256-cbc -a -salt -in $DAY.tar.gz -out $DAY.enc && rm $DAY.tar.gz' #Change to secure delete if using a non SSD

#System / Package manager commands
alias install="$INSTALLCMD"
alias update="$UPDATEMIRRORCMD"
alias upgrade="$UPDATECMD"
alias remove="$REMOVECMD"

alias updatebashrc='cd ~/ && cp .bashrc .bashrc.bak && wget https://github.com/terrorbyte/bashrc/raw/master/.bashrc && cd -'

#Extract Function
extract() {
    local c e i

    (($#)) || return

    for i; do
        c=''
        e=1

        if [[ ! -r $i ]]; then
            echo "$0: file is unreadable: \`$i'" >&2
            continue
        fi

        case $i in
        *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
               c='bsdtar xvf';;
        	*.7z)  c='7z x';;
        	*.Z)   c='uncompress';;
        	*.bz2) c='bunzip2';;
        	*.exe) c='cabextract';;
        	*.gz)  c='gunzip';;
        	*.rar) c='unrar x';;
        	*.xz)  c='unxz';;
        	*.zip) c='unzip';;
        	*)     echo "$0: unrecognized file extension: \`$i'" >&2
               continue;;
        esac

        command $c "$i"
        e=$?
    done

    return $e
}
