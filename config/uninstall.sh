#!/bin/bash
rm -rf ~/.config/terrorshell
cp -f /etc/skel/.bashrc ~/.bashrc
echo "TerrorShell Uninstalled..."
bash && kill -SIGKILL $$
