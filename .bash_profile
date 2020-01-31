# bash prompt (set to path by default)

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
alias bp.="alias."


# git

alias gpu="git pull"
alias gs="git status"
alias gb="git branch"
alias gf="git fetch && gbs"
alias gch="git checkout"
alias gcb="gch -b"
alias gd="git diff"
alias gbs="cl && pwd && nl && l && nl && gb && gs && nl"
alias gf="git fetch && gbs"
c() { if [ -e .git ]; then gbs; else cl; fi ; }
alias gaa="git add . && c"
gcl() { REPO=$* && FOLDER_NAME=$(echo $REPO | sed 's|.*/||') && FOLDER_NAME=${FOLDER_NAME%.*} && git clone $REPO && cd $FOLDER_NAME && c ; }
alias gl="git log && c"
alias gp="git push && c"
gco() { COMMIT_MESSAGE=$* && if [[ -z $COMMIT_MESSAGE ]]; then git commit -m "wip"; else git commit -m "$COMMIT_MESSAGE"; fi && c ; }
gac() { COMMIT_MESSAGE=$* && if [[ -z $COMMIT_MESSAGE ]]; then gaa && gco $COMMIT_MESSAGE; else gaa && gco; fi && c ; }
gacp() { COMMIT_MESSAGE=$* && if [[ -z $COMMIT_MESSAGE ]]; then gac $COMMIT_MESSAGE; else gac; fi && gp && c ; }
alias gcou="git reset HEAD~ --soft && c"
alias obliterate!="GIT_URL=$(git config --get remote.origin.url) && FOLDER_NAME=${PWD##*/} && .. && rm -rf $FOLDER_NAME && c && echo Resetting $FOLDER_NAME && nl && gc $GIT_URL && cd $FOLDER_NAME && c"
gopen() { GIT_URL=$(git config --get remote.origin.url) && GIT_URL=$(echo $GIT_URL | sed 's/^git@github.com:/https:\/\/github.com\//') && GIT_URL=${GIT_URL%.*} && open $GIT_URL ; }

# go somewhere

alias ~="cd ~ && cl && c"
alias desktop="cd ~/desktop && cl && c && pwd && nl && l && nl"
alias workspace="cd $WORKSPACE && cl && c && pwd && nl && l && nl"
alias ..="cd .. && c"
alias ...="cd ../.. && c"
alias ....="cd ../../.. && c"
alias .....="cd../../../.. && c"
alias ......="cd../../../../.. && c"


c
