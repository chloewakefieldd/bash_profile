# bash prompt (set to path by default)

PS1="\w "


# set vars

WORKSPACE=~/workspace


# print something

alias cl="clear"
alias bpcat="cat ~/.bash_profile"
# demo
bpgrep() { STRING=$* && grep $STRING ~/.bash_profile ; }
nl() { echo ; }
alias l="ls"
alias ll="ls -la"


# git
alias gs="git status"
alias gb="git branch"
# demo
alias gbr='REMOTE_BRANCH_LIST=$(git branch -r) && nl && for word in $REMOTE_BRANCH_LIST; do echo $word | sed '"'"'s/^origin\///'"'"'; done && nl'
alias gbs="cl && pwd && nl && l && nl && gb && gs && nl"
# demo
c() { if [ -e .git ]; then gbs; else cl; fi ; }
alias gpu="git pull"
alias gch="git checkout"
alias gcb="gch -b"
alias gd="git diff"
alias gds="gd --staged"
alias gf="git fetch && c"
# demo
alias gdf="cl && echo Fetching ... && nl && git fetch && nl && echo START origin/master diff && gd origin/master && echo END origin/master diff && nl"
alias gaa="git add . && c"
gc() { REPO=$* && FOLDER_NAME=$(echo $REPO | sed 's|.*/||') && FOLDER_NAME=${FOLDER_NAME%.*} && git clone $REPO && cd $FOLDER_NAME && c ; }
alias gcw="cd $WORKSPACE && gc"
alias gl="git log && c"
alias gp="git push && c"
gco() { COMMIT_MESSAGE=$* && if [[ -z $COMMIT_MESSAGE ]]; then git commit -m "wip"; else git commit -m "$COMMIT_MESSAGE"; fi && c ; }
gac() { COMMIT_MESSAGE=$* && if [[ -z $COMMIT_MESSAGE ]]; then gaa && gco; else gaa && gco $COMMIT_MESSAGE; fi && c ; }
gacp() { COMMIT_MESSAGE=$* && if [[ -z $COMMIT_MESSAGE ]]; then gac; else gac $COMMIT_MESSAGE; fi && cl && FOLDER_NAME=${PWD##*/}/ && echo Pushing $FOLDER_NAME && nl && gp && nl && echo Pushed && c ; }
# demo
alias gcou="git reset HEAD~ --soft && c"
alias gcoundo="gcou"
alias obliterate!="GIT_URL=$(git config --get remote.origin.url) && FOLDER_NAME=${PWD##*/} && .. && rm -rf $FOLDER_NAME && c && echo Resetting $FOLDER_NAME && nl && gc $GIT_URL && cd $FOLDER_NAME && c"
gopen() { GIT_URL=$(git config --get remote.origin.url) && GIT_URL=$(echo $GIT_URL | sed 's/^git@github.com:/https:\/\/github.com\//') && GIT_URL=${GIT_URL%.*} && open $GIT_URL ; }


# npm
#demo
nrd() { PORT=$* && PORT=$PORT npm run debug ; }
alias nt="npm run test"
alias ntu="npm run test:unit"
alias nti="npm run test:integration"
alias nte="npm run test:e2e"


# go somewhere

alias ~="cd ~ && cl && c"
alias desktop="cd ~/desktop && cl && c && pwd && nl && l && nl"
alias workspace="cd $WORKSPACE && cl && c && pwd && nl && l && nl"
alias wp=workspace
alias ..="cd .. && c"
alias ...="cd ../.. && c"
alias ....="cd ../../.. && c"
alias .....="cd../../../.. && c"
alias ......="cd../../../../.. && c"


# general

alias resource="source ~/.bash_profile && c && echo sourced from  ~/.bash_profile && nl"
alias alias.="vim ~/.bash_profile && c && resource"
alias bp.="alias."
alias alias.c="code ~/.bash_profile"
alias code.="code . && c"
alias open.="open . && c"
cd.() { MY_DIR=$* && cd $MY_DIR && c ; }
# demo
gacpbp() { CURRENT_DIRECTORY=$(pwd) && ~ && gacp; cd. $CURRENT_DIRECTORY ; }


# iPlayer

alias ipl_atoz="cd. $WORKSPACE/iplayer-web-app-atoz"
alias ipl_boilerplate="cd. $WORKSPACE/iplayer-web-app-boilerplate"
alias ipl_features="cd. $WORKSPACE/iplayer-web-app-features"
alias ipl_guide="cd. $WORKSPACE/iplayer-web-app-guide"
alias ipl_highlights="cd. $WORKSPACE/iplayer-web-app-highlights"
alias ipl_homepage="cd. $WORKSPACE/iplayer-web-app-homepage"
alias ipl_lists="cd. $WORKSPACE/iplayer-web-app-lists"
alias ipl_programmes="cd. $WORKSPACE/iplayer-web-app-myprogrammes"
alias ipl_playback="cd. $WORKSPACE/iplayer-web-app-playback-v2"
alias ipl_proxy="cd. $WORKSPACE/iplayer-web-dev-proxy"
alias ipl_styleguide="cd. $WORKSPACE/iplayer-web-app-styleguide"
alias ipl_webcomponents="cd. $WORKSPACE/iplayer-web-components"
alias ipl_storybook="ipl_webcomponents"

alias ipl_atoz.="ipl_atoz && open."
alias ipl_boilerplate.="ipl_boilerplate && open."
alias ipl_features.="ipl_features && open."
alias ipl_guide.="ipl_guide && open."
alias ipl_highlights.="ipl_highlights && open."
alias ipl_homepage.="ipl_homepage && open."
alias ipl_lists.="ipl_lists && open."
alias ipl_programmes.="ipl_programmes && open."
alias ipl_playback.="ipl_playback && open."
alias ipl_proxy.="ipl_proxy && open."
alias ipl_styleguide.="ipl_styleguide && open."
alias ipl_webcomponents.="ipl_webcomponents && open."
alias ipl_storybook.="ipl_webcomponents."

alias ipl_atoz.c="ipl_atoz && code."
alias ipl_boilerplate.c="ipl_boilerplate && code."
alias ipl_features.c="ipl_features && code."
alias ipl_guide.c="ipl_guide && code."
alias ipl_highlights.c="ipl_highlights && code."
alias ipl_homepage.c="ipl_homepage && code."
alias ipl_lists.c="ipl_lists && code."
alias ipl_programmes.c="ipl_programmes && code."
alias ipl_playback.c="ipl_playback && code."
alias ipl_proxy.c="ipl_proxy && code."
alias ipl_styleguide.c="ipl_styleguide && code."
alias ipl_webcomponents.c="ipl_webcomponents && code."
alias ipl_storybook.c="ipl_webcomponents.c"

alias ipl_editproxy="code $WORKSPACE/iplayer-web-dev-proxy/config/local.js"
alias ipl_setproxy="echo -e \'use strict\'\; \\n\\nconst sandbox = \'http://sandbox.bbc.co.uk\'\;\\n\\nmodule.exports = {\\n\ \ guideFrontend: \`\${sandbox}:8080\`\\n}\; > file.js"

ipl_atoz.p() { PORT=$* && echo $PORT && echo -e \'use strict\'\; \\n\\nconst sandbox = \'http://sandbox.bbc.co.uk\'\;\\n\\nmodule.exports = {\\n\ \ atozFrontend: \`\${sandbox}:$PORT\`\\n}\; > $WORKSPACE/iplayer-web-dev-proxy/config/file.js ; }
ipl_boilerplate.p() { PORT=$* && echo $PORT && echo -e \'use strict\'\; \\n\\nconst sandbox = \'http://sandbox.bbc.co.uk\'\;\\n\\nmodule.exports = {\\n\ \ boilerplateFrontend: \`\${sandbox}:$PORT\`\\n}\; > $WORKSPACE/iplayer-web-dev-proxy/config/file.js ; }
ipl_features.p() { PORT=$* && echo $PORT && echo -e \'use strict\'\; \\n\\nconst sandbox = \'http://sandbox.bbc.co.uk\'\;\\n\\nmodule.exports = {\\n\ \ featuresFrontend: \`\${sandbox}:$PORT\`\\n}\; > $WORKSPACE/iplayer-web-dev-proxy/config/file.js ; }
ipl_guide.p() { PORT=$* && echo $PORT && echo -e \'use strict\'\; \\n\\nconst sandbox = \'http://sandbox.bbc.co.uk\'\;\\n\\nmodule.exports = {\\n\ \ guideFrontend: \`\${sandbox}:$PORT\`\\n}\; > $WORKSPACE/iplayer-web-dev-proxy/config/file.js ; }
ipl_highlights.p() { PORT=$* && echo $PORT && echo -e \'use strict\'\; \\n\\nconst sandbox = \'http://sandbox.bbc.co.uk\'\;\\n\\nmodule.exports = {\\n\ \ highlightsFrontend: \`\${sandbox}:$PORT\`\\n}\; > $WORKSPACE/iplayer-web-dev-proxy/config/file.js ; }
ipl_homepage.p() { PORT=$* && echo $PORT && echo -e \'use strict\'\; \\n\\nconst sandbox = \'http://sandbox.bbc.co.uk\'\;\\n\\nmodule.exports = {\\n\ \ homepageFrontend: \`\${sandbox}:$PORT\`\\n}\; > $WORKSPACE/iplayer-web-dev-proxy/config/file.js ; }
ipl_lists.p() { PORT=$* && echo $PORT && echo -e \'use strict\'\; \\n\\nconst sandbox = \'http://sandbox.bbc.co.uk\'\;\\n\\nmodule.exports = {\\n\ \ listsFrontend: \`\${sandbox}:$PORT\`\\n}\; > $WORKSPACE/iplayer-web-dev-proxy/config/file.js ; }
ipl_programmes.p() { PORT=$* && echo $PORT && echo -e \'use strict\'\; \\n\\nconst sandbox = \'http://sandbox.bbc.co.uk\'\;\\n\\nmodule.exports = {\\n\ \ myprogrammesFrontend: \`\${sandbox}:$PORT\`\\n}\; > $WORKSPACE/iplayer-web-dev-proxy/config/file.js ; }
ipl_playback.p() { PORT=$* && echo $PORT && echo -e \'use strict\'\; \\n\\nconst sandbox = \'http://sandbox.bbc.co.uk\'\;\\n\\nmodule.exports = {\\n\ \ playbackFrontend: \`\${sandbox}:$PORT\`\\n}\; > $WORKSPACE/iplayer-web-dev-proxy/config/file.js ; }
ipl_webcomponents.p() { PORT=$* && echo $PORT && echo -e \'use strict\'\; \\n\\nconst sandbox = \'http://sandbox.bbc.co.uk\'\;\\n\\nmodule.exports = {\\n\ \ storybookFrontend: \`\${sandbox}:$PORT\`\\n}\; > $WORKSPACE/iplayer-web-dev-proxy/config/file.js ; }
ipl_storybook.p() { PORT=$* && echo $PORT && echo -e \'use strict\'\; \\n\\nconst sandbox = \'http://sandbox.bbc.co.uk\'\;\\n\\nmodule.exports = {\\n\ \ storybookFrontend: \`\${sandbox}:$PORT\`\\n}\; > $WORKSPACE/iplayer-web-dev-proxy/config/file.js ; }
ipl_discoveryservice.p() { PORT=$* && echo $PORT && echo -e \'use strict\'\; \\n\\nconst sandbox = \'http://sandbox.bbc.co.uk\'\;\\n\\nmodule.exports = {\\n\ \ discoveryService: \`\${sandbox}:$PORT\`\\n}\; > $WORKSPACE/iplayer-web-dev-proxy/config/file.js ; }
ipl_staticassets.p() { PORT=$* && echo $PORT && echo -e \'use strict\'\; \\n\\nconst sandbox = \'http://sandbox.bbc.co.uk\'\;\\n\\nmodule.exports = {\\n\ \ staticAssetsService: \`\${sandbox}:$PORT\`\\n}\; > $WORKSPACE/iplayer-web-dev-proxy/config/file.js ; }

# other

export GPG_TTY=$(tty)


# finish with clear
c
