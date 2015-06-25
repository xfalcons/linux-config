# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Ensure user-installed binaries take precedence
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH

alias vi=vim
alias tmux="TERM=screen-256color-bce tmux"

# Set ls color mode
platform='unknown'
unamestr=`uname -s`
if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='freebsd'
fi

if [[ $platform == 'linux' ]]; then
    alias ls='ls --color=auto'
elif [[ $platform == 'freebsd' ]]; then
    export CLICOLOR=1
fi

export LANG=en_US.UTF-8

set meta-flag on
set input-meta on
set output-meta on
set convert-meta off

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
