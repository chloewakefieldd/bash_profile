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


# git
alias gs="git status"
alias gb="git branch"
alias gbr='REMOTE_BRANCH_LIST=$(git branch -r) && for word in $REMOTE_BRANCH_LIST; do echo $word | sed '"'"'s/^origin\///'"'"'; done'
alias gbs="cl && pwd && nl && l && nl && gb && gs && nl"
c() { if [ -e .git ]; then gbs; else cl; fi ; }
alias gpu="git pull"
alias gch="git checkout"
alias gcb="gch -b"
alias gd="git diff"
alias gf="git fetch && c"
alias gdf="cl && echo Fetching ... && nl && git fetch && nl && echo START origin/master diff && gd origin/master && echo END origin/master diff && nl"
alias gaa="git add . && c"
gc() { REPO=$* && FOLDER_NAME=$(echo $REPO | sed 's|.*/||') && FOLDER_NAME=${FOLDER_NAME%.*} && git clone $REPO && cd $FOLDER_NAME && c ; }
alias gcw="cd $WORKSPACE && gc"
alias gl="git log && c"
alias gp="git push && c"
gco() { COMMIT_MESSAGE=$* && if [[ -z $COMMIT_MESSAGE ]]; then git commit -m "wip"; else git commit -m "$COMMIT_MESSAGE"; fi && c ; }
gac() { COMMIT_MESSAGE=$* && if [[ -z $COMMIT_MESSAGE ]]; then gaa && gco; else gaa && gco $COMMIT_MESSAGE; fi && c ; }
gacp() { COMMIT_MESSAGE=$* && if [[ -z $COMMIT_MESSAGE ]]; then gac; else gac $COMMIT_MESSAGE; fi && cl && FOLDER_NAME=${PWD##*/}/ && echo Pushing $FOLDER_NAME && nl && gp && nl && echo Pushed && c ; }
alias gcou="git reset HEAD~ --soft && c"
alias gcoundo="gcou"
alias obliterate!="GIT_URL=$(git config --get remote.origin.url) && FOLDER_NAME=${PWD##*/} && .. && rm -rf $FOLDER_NAME && c && echo Resetting $FOLDER_NAME && nl && gc $GIT_URL && cd $FOLDER_NAME && c"
gopen() { GIT_URL=$(git config --get remote.origin.url) && GIT_URL=$(echo $GIT_URL | sed 's/^git@github.com:/https:\/\/github.com\//') && GIT_URL=${GIT_URL%.*} && open $GIT_URL ; }

# npm
nrd() { PORT=$* && PORT=$PORT npm run debug ; }

# go somewhere

alias ~="cd ~ && cl && c"
alias desktop="cd ~/desktop && cl && c && pwd && nl && l && nl"
alias workspace="cd $WORKSPACE && cl && c && pwd && nl && l && nl"
alias ..="cd .. && c"
alias ...="cd ../.. && c"
alias ....="cd ../../.. && c"
alias .....="cd../../../.. && c"
alias ......="cd../../../../.. && c"


# general

alias resource="source ~/.bash_profile && c && echo sourced from  ~/.bash_profile && nl"
alias alias.="vim ~/.bash_profile && c && resource"
alias bp.="alias."
alias code.="code . && c"
alias open.="open . && c"
cd.() { MY_DIR=$* && cd $MY_DIR && c ; }


# other

export GPG_TTY=$(tty)

# finish with clear
c
