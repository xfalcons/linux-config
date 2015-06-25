#!/bin/sh
CONFIG_HOME=~/.linux-config
CONFIG_BACKUP=~/linux-config.bak

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

[ -e $CONFIG_HOME ] && die "$CONFIG_HOME already exists."

echo "Cloning linux-config..."
git clone https://github.com/xfalcons/linux-config.git "$CONFIG_HOME"

cd $HOME
[ ! -d "bin" ] && mkdir -p bin
rm -rf $CONFIG_BACKUP
mkdir $CONFIG_BACKUP

for i in '.profile' '.bashrc' '.tmux.conf' '.gitconfig' 'git-completion' 'bin/git_diff_wrapper'
do
    [ -e $i ] && mv $i $CONFIG_BACKUP/
    ln -s $CONFIG_HOME/$i $i
done

echo "Install VIM config and plugins..."
wget -O - https://raw.github.com/xfalcons/vimrc/master/auto-install.sh | sh

echo "Install Fancy git-prompt"
git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt

echo "Linux-Ubuntu configuration file has been installed."

cd $HOME
