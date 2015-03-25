# Load .bashrc if it exists

export GIT_PROMPT_THEME=Solarized
[[ -s ~/.bash-git-prompt/gitprompt.sh ]] && source ~/.bash-git-prompt/gitprompt.sh ]]

export PROMPT_COMMAND='echo -ne "\033];${HOSTNAME}\007"; ';
