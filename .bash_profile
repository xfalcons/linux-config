# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Ensure user-installed binaries take precedence
export PATH=~/bin:~/adt/sdk/tools:~/adt/sdk/platform-tools:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:~/adt/sdk/build-tools/18.1.1:$PATH

# Setup JAVA_HOME
export JAVA_HOME=`/usr/libexec/java_home`

alias vi=vim
alias tmux="TERM=screen-256color-bce tmux"

# are we an interactive shell?
if [ "$PS1" ]; then
    case $TERM in
    xterm*)
        if [ -e /etc/sysconfig/bash-prompt-xterm ]; then
            PROMPT_COMMAND=/etc/sysconfig/bash-prompt-xterm
        else
            PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME%%.*}:${PWD/#$HOME/~}"; echo -ne "\007"'
        fi
        ;;
    screen)
        if [ -e /etc/sysconfig/bash-prompt-screen ]; then
            PROMPT_COMMAND=/etc/sysconfig/bash-prompt-screen
        else
            PROMPT_COMMAND='echo -ne "\033_${HOSTNAME%%.*}:${PWD/#$HOME/~}"; echo -ne "\033\\"'
        fi
        ;;
    *)
        [ -e /etc/sysconfig/bash-prompt-default ] && PROMPT_COMMAND=/etc/sysconfig/bash-prompt-default
        ;;
    esac
    # Turn on checkwinsize
    shopt -s checkwinsize
    #[ "$PS1" = "\\s-\\v\\\$ " ] && PS1="[\h \w]\\$ "
    #PS1="[\h \w]\\$ "
    PS1="\[\033[0;32m\][\u@\h:\[\033[0;33m\\w\[\033[0;32m\]]$\[\033[0m\] "
fi

export LANG=zh_TW.UTF-8
export CLICOLOR=1

set meta-flag on
set input-meta on
set output-meta on
set convert-meta off

# Load .bashrc if it exists
[[ -s ~/.bashrc ]] && source ~/.bashrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
