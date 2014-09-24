TerrorShell
===========

The TerrorShell is an attempt to bring bash back into the main spotlight for customizability and ease of use. We took all the best parts from zsh, csh, oh-my-zsh, and some personal inspiration and tried to create a simple bash configuration that would allow some advanced features.

Screenshots
===========

![alt text](http://i.imgur.com/EESj3jS.png "Terrortheme Example")
An advanced theme and example (terrortheme)

Features
========

* Sane Defaults: By default TerrorShell will make bash much easier to use, prettier, and hopefully quicker.
* Package Manager Wrapper: Sometimes you don't want to have to remember which distro (or package manager) is on the computer you're using, with TerrorShell its as simple as 'install ' and the rest will be handled for you. See the [wrapper documentation](https://github.com/terrorbyte/terrorshell/wiki/Modules#pkgmngr).
* Git Integration: One of the things you hear about a lot is shells having integration with Git and other source management systems. See the [git documentation](https://github.com/terrorbyte/terrorshell/wiki/Modules#git)
* Aliases: We attempted to try and create some of the best built in bash aliases to make your life that much easier (or quicker). See [alias documentation](https://github.com/terrorbyte/terrorshell/wiki/Modules#terrorshell--tshell).
* Modules: Tack in your new module (maybe SVN directory integration) into the .bashrc modules variable and the terrorshell module directory and you are off. See [docs](https://github.com/terrorbyte/terrorshell/wiki/Modules#module-list).
* Installer / Updater: Stay up to date in a non-intrusive way. The updates are up to you and backups are made after each update.
* Per-directory Commands: Sometimes you are in a specific directory you might need different aliases or scripts.

Install
=======

**Maual Install**

```git clone https://github.com/terrorbyte/bashrc.git ~/.terrorshell```

Back up old bashrc

```cp ~/.bashrc ~/.bashrc.old```

Copy the new config

```cp ~/.terrorshell/templates/.bashrc ~/.bashrc```

Source your new shell

```source ~/.bashrc```


Themes
======

See a list of themes [here](https://github.com/terrorbyte/terrorshell/wiki/Theme-List)

See how to make themes [here](https://github.com/terrorbyte/terrorshell/wiki/Themes)

Uninstall
=========

Simply run uninstall.sh in the config directory.
