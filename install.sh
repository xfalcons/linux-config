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

git clone git@github.com:miiicasa/linux-config.git "$CONFIG_HOME"

cd "$CONFIG_HOME"
git submodule update --init

cd ~
ln -s .config/.vim .vim
ln -s .config/.vim/.vimrc .vimrc
ln -s .config/.zshrc .zshrc
ln -s .config/.tmux.conf .tmux.conf
ln -s .config/.gitconfig .gitconfig
ln -s .config/git_diff_wrapper git_diff_wrapper
ln -s ~/.config/compass_lite ~/compass_lite
ln -s .config/.git-completion .git-completion

cd "${CONFIG_HOME}/.vim"
git submodule update --init

echo "miiiCasa configuration file has been installed."

cd "$CONFIG_HOME"
