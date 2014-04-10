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

git clone https://github.com/xfalcons/linux-config.git "$CONFIG_HOME"

cd "$CONFIG_HOME"
git submodule update --init

cd ~
ln -s .config/.vim .vim
ln -s .config/.bash_profile .bash_profile
ln -s .config/.bashrc .bashrc
ln -s .config/.tmux.conf .tmux.conf
ln -s .config/.gitconfig .gitconfig
ln -s .config/git_diff_wrapper git_diff_wrapper
ln -s .config/.git-completion .git-completion

cd "${CONFIG_HOME}/.vim"
git submodule update --init
./install-vimrc.sh

echo "Xfalcons configuration file has been installed."

cd "$CONFIG_HOME"
