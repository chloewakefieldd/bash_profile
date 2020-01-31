# bash prompt
# set to path by default

PS1="\w "

# set vars
WORKSPACE=~/workspace

# print something
alias cl="clear"
alias bpcat="cat ~/.bash_profile"
bpgrep() { STRING=$* && grep $STRING ~/.bash_profile ; }
nl() { echo ; }
alias l="ls"
alias ll="ls -la"

# general
alias resource="source ~/.bash_profile && cl && echo sourced from  ~/.bash_profile"
alias alias.="vim ~/.bash_profile && resource"

# go somewhere
alias ~="cd ~ && cl"
alias desktop="cd ~/desktop && cl"
alias workspace="cd $WORKSPACE && cl"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd../../../.."

# git

alias gc="git clone"
alias gpu="git pull"
alias gp="git push"
alias gs="git status"
alias gb="git branch"
alias gch="git checkout"
alias gcb="gch -b"
alias gbs="cl && pwd && nl && l && nl && gb && gs && nl"
alias gco="git commit -m"
alias gaa="git add ."
alias gac="gaa && gco"
c() { if [ -e .git ]; then gbs; else cl; fi ; }

alias obliterate!="GIT_URL=$(git config --get remote.origin.url) && FOLDER_NAME=${PWD##*/} && .. && rm -rf $FOLDER_NAME && c && echo Resetting $FOLDER_NAME && nl && gc $GIT_URL && cd $FOLDER_NAME && c"



c
