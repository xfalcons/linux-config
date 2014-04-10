#!/bin/sh
CONFIG_HOME=~/.config

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

[ -e "~/.config" ] && die "~/.config already exists."

git clone git@github.com:xfalcons/linux-config.git "$CONFIG_HOME"

cd ~
ln -s .config/.bash_profile .bash_profile
ln -s .config/.bashrc .bashrc
ln -s .config/.tmux.conf .tmux.conf
ln -s .config/.gitconfig .gitconfig
ln -s .config/git_diff_wrapper git_diff_wrapper
ln -s .config/.git-completion .git-completion

wget -O - https://raw.github.com/xfalcons/vimrc/master/auto-install.sh | sh

echo "Xfalcons configuration file has been installed."

cd "$CONFIG_HOME"
