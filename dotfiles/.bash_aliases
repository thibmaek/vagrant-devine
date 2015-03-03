# Navigational
alias ..="cd .."
alias ...="cd ../.."
alias lsa="ls -a"
alias rmrf="sudo rm -rf"
alias al="nano ~/.bash_aliases"
alias temp="mkd temp"

# Git aliases (prefered over .gitconfig)
alias ga="git add"
alias gaa="git add ."
alias gs="git status"
alias gc="git commit -m"
alias gps="git push"
alias gpl="git pull"
alias gro="git remote add origin"

# Detect ls color
if ls --color > /dev/null 2>&1; then
  colorflag="--color"
fi
# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# List a specific package. Example: lsapt apache
alias lsapt="dpkg --get-selections | grep"

# Reload the shell
alias reload="exec $SHELL -l"
