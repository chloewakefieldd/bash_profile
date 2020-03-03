# bash prompt (set to path by default)

PS1="\w "


# set vars

WORKSPACE=~/workspace


# print something

alias cl="clear"
alias bpcat="cat ~/.bash_profile"
bpgrep() { STRING=$* && grep $STRING ~/.bash_profile ; }
alias bpgp="bpgrep"
nl() { echo ; }
alias l="ls"
alias ll="ls -la"


# git

alias gs="git status"
alias gb="git branch"
alias gdb="git branch -D"
alias gbr='REMOTE_BRANCH_LIST=$(git branch -r) && nl && for word in $REMOTE_BRANCH_LIST; do echo $word | sed '"'"'s/^origin\///'"'"'; done && nl'
alias gbs="cl && pwd && nl && l && nl && gb && gs && nl"
c() { if [ -e .git ]; then gbs; else cl; fi ; }
alias gpu="git pull"
alias gch="git checkout"
alias gcb="gch -b"
alias gd="git diff"
alias gds="gd --staged"
alias gf="git fetch && c"
alias gdf="cl && echo Fetching ... && nl && git fetch && nl && echo START origin/master diff && gd origin/master && echo END origin/master diff && nl"
alias gchm="gf && gch master && gpu && gdf && nl && pwd && nl && l && nl && gb && gs && nl"
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
alias obliterate!="GIT_URL=$(git config --get remote.origin.url) && FOLDER_NAME=${pwd##*/} && cd .. && rm -rf $FOLDER_NAME && echo Resetting $FOLDER_NAME && nl && gc $GIT_URL"
gopen() { GIT_URL=$(git config --get remote.origin.url) && GIT_URL=$(echo $GIT_URL | sed 's/^git@github.com:/https:\/\/github.com\//') && GIT_URL=${GIT_URL%.*} && open $GIT_URL ; }


# go somewhere

alias ~="cd ~ && cl && c"
alias desktop="cd ~/desktop && cl && c && pwd && nl && l && nl"
alias dp="desktop"
alias workspace="cd $WORKSPACE && cl && c && pwd && nl && l && nl"
alias wp=workspace
alias ..="cd .. && c"
alias ...="cd ../.. && c"
alias ....="cd ../../.. && c"
alias .....="cd../../../.. && c"
alias ......="cd../../../../.. && c"


# npm
alias nrb="npm run build"
nrd() { PORT=$* && PORT=$PORT npm run debug ; }
alias nt="npm run test"
alias ntu="npm run test:unit"
alias nti="npm run test:integration"
alias nte="WEBDRIVER_BASE_URL=https://sandbox.bbc.co.uk WEBDRIVER_BROWSER=chrome WEBDRIVER_DRIVER_VERSION=$chromedriverversion npm run test:e2e"
alias ntel="WEBDRIVER_BROWSER=chrome WEBDRIVER_DRIVER_VERSION=$chromedriverversion npm run test:e2e -- --spec"
alias ntes="WEBDRIVER_BASE_URL=https://sandbox.bbc.co.uk WEBDRIVER_BROWSER=chrome WEBDRIVER_DRIVER_VERSION=$chromedriverversion npm run test:e2e"
alias ntels="WEBDRIVER_BROWSER=chrome WEBDRIVER_DRIVER_VERSION=$chromedriverversion npm run test:e2e -- --spec"


gci() { GIT_URL=$* && gc $GIT_URL && npm ci && c && nl && echo Installed && nl && nl ; }
gcwi() { wp && GIT_URL=$* && gc $GIT_URL && npm ci && c && nl && echo Installed && nl && nl ; }


# general

alias resource="source ~/.bash_profile && c && echo sourced from  ~/.bash_profile && nl"
alias rs="resource"
alias alias.="vim ~/.bash_profile && c && resource"
alias bp.="alias."
alias alias.c="code ~/.bash_profile"
alias code.="code . && c"
alias open.="open . && c"
cd.() { MY_DIR=$* && cd $MY_DIR && c ; }
gacpbp() { CURRENT_DIRECTORY=$(pwd) && ~ && git add .bash_profile && gacp; cd. $CURRENT_DIRECTORY ; }


# iPlayer

alias ipl_atoz="cd. $WORKSPACE/iplayer-web-app-atoz"
alias ipl_boilerplate="cd. $WORKSPACE/iplayer-web-app-boilerplate"
alias ipl_features="cd. $WORKSPACE/iplayer-web-app-features"
alias ipl_guide="cd. $WORKSPACE/iplayer-web-app-guide"
alias ipl_highlights="cd. $WORKSPACE/iplayer-web-app-highlights"
alias ipl_homepage="cd. $WORKSPACE/iplayer-web-app-homepage"
alias ipl_lists="cd. $WORKSPACE/iplayer-web-app-lists"
alias ipl_pagebuilder="cd. $WORKSPACE/iplayer-web-page-builder"
alias ipl_programmes="cd. $WORKSPACE/iplayer-web-app-myprogrammes"
alias ipl_playback="cd. $WORKSPACE/iplayer-web-app-playback-v2"
alias ipl_polyfills="cd. $WORKSPACE/iplayer-web-polyfills"
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
alias ipl_pagebuilder.="ipl_pagebuilder && open."
alias ipl_programmes.="ipl_programmes && open."
alias ipl_playback.="ipl_playback && open."
alias ipl_proxy.="ipl_proxy && open."
alias ipl_polyfills.="ipl_polyfills && open."
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
alias ipl_pagebuilder.c="ipl_pagebuilder && code."
alias ipl_programmes.c="ipl_programmes && code."
alias ipl_playback.c="ipl_playback && code."
alias ipl_proxy.c="ipl_proxy && code."
alias ipl_polyfills.c="ipl_polyfills && code."
alias ipl_styleguide.c="ipl_styleguide && code."
alias ipl_webcomponents.c="ipl_webcomponents && code."
alias ipl_storybook.c="ipl_webcomponents.c"

alias ipl_editproxy="code $WORKSPACE/iplayer-web-dev-proxy/config/local.js"
#ipl_rp() { cd $WORKSPACE/iplayer-web-dev-proxy && nrd ; }

ipl_atoz_setport() { PORT=$* && echo $PORT && echo -e \'use strict\'\; \\n\\nconst sandbox = \'http://sandbox.bbc.co.uk\'\;\\n\\nmodule.exports = {\\n\ \ atozFrontend: \`\${sandbox}:$PORT\`\\n}\; > $WORKSPACE/iplayer-web-dev-proxy/config/local.js ; }
ipl_boilerplate_setport() { PORT=$* && echo $PORT && echo -e \'use strict\'\; \\n\\nconst sandbox = \'http://sandbox.bbc.co.uk\'\;\\n\\nmodule.exports = {\\n\ \ boilerplateFrontend: \`\${sandbox}:$PORT\`\\n}\; > $WORKSPACE/iplayer-web-dev-proxy/config/local.js ; }
ipl_features_setport() { PORT=$* && echo $PORT && echo -e \'use strict\'\; \\n\\nconst sandbox = \'http://sandbox.bbc.co.uk\'\;\\n\\nmodule.exports = {\\n\ \ featuresFrontend: \`\${sandbox}:$PORT\`\\n}\; > $WORKSPACE/iplayer-web-dev-proxy/config/local.js ; }
ipl_guide_setport() { PORT=$* && echo $PORT && echo -e \'use strict\'\; \\n\\nconst sandbox = \'http://sandbox.bbc.co.uk\'\;\\n\\nmodule.exports = {\\n\ \ guideFrontend: \`\${sandbox}:$PORT\`\\n}\; > $WORKSPACE/iplayer-web-dev-proxy/config/local.js ; }
ipl_highlights_setport() { PORT=$* && echo $PORT && echo -e \'use strict\'\; \\n\\nconst sandbox = \'http://sandbox.bbc.co.uk\'\;\\n\\nmodule.exports = {\\n\ \ highlightsFrontend: \`\${sandbox}:$PORT\`\\n}\; > $WORKSPACE/iplayer-web-dev-proxy/config/local.js ; }
ipl_homepage_setport() { PORT=$* && echo $PORT && echo -e \'use strict\'\; \\n\\nconst sandbox = \'http://sandbox.bbc.co.uk\'\;\\n\\nmodule.exports = {\\n\ \ homepageFrontend: \`\${sandbox}:$PORT\`\\n}\; > $WORKSPACE/iplayer-web-dev-proxy/config/local.js ; }
ipl_lists_setport() { PORT=$* && echo $PORT && echo -e \'use strict\'\; \\n\\nconst sandbox = \'http://sandbox.bbc.co.uk\'\;\\n\\nmodule.exports = {\\n\ \ listsFrontend: \`\${sandbox}:$PORT\`\\n}\; > $WORKSPACE/iplayer-web-dev-proxy/config/local.js ; }
ipl_programmes_setport() { PORT=$* && echo $PORT && echo -e \'use strict\'\; \\n\\nconst sandbox = \'http://sandbox.bbc.co.uk\'\;\\n\\nmodule.exports = {\\n\ \ myprogrammesFrontend: \`\${sandbox}:$PORT\`\\n}\; > $WORKSPACE/iplayer-web-dev-proxy/config/local.js ; }
ipl_playback_setport() { PORT=$* && echo $PORT && echo -e \'use strict\'\; \\n\\nconst sandbox = \'http://sandbox.bbc.co.uk\'\;\\n\\nmodule.exports = {\\n\ \ playbackFrontend: \`\${sandbox}:$PORT\`\\n}\; > $WORKSPACE/iplayer-web-dev-proxy/config/local.js ; }
ipl_webcomponents_setport() { PORT=$* && echo $PORT && echo -e \'use strict\'\; \\n\\nconst sandbox = \'http://sandbox.bbc.co.uk\'\;\\n\\nmodule.exports = {\\n\ \ storybookFrontend: \`\${sandbox}:$PORT\`\\n}\; > $WORKSPACE/iplayer-web-dev-proxy/config/local.js ; }
ipl_storybook_setport() { PORT=$* && echo $PORT && echo -e \'use strict\'\; \\n\\nconst sandbox = \'http://sandbox.bbc.co.uk\'\;\\n\\nmodule.exports = {\\n\ \ storybookFrontend: \`\${sandbox}:$PORT\`\\n}\; > $WORKSPACE/iplayer-web-dev-proxy/config/local.js ; }
ipl_discoveryservice_setport() { PORT=$* && echo $PORT && echo -e \'use strict\'\; \\n\\nconst sandbox = \'http://sandbox.bbc.co.uk\'\;\\n\\nmodule.exports = {\\n\ \ discoveryService: \`\${sandbox}:$PORT\`\\n}\; > $WORKSPACE/iplayer-web-dev-proxy/config/local.js ; }
ipl_staticassets_setport() { PORT=$* && echo $PORT && echo -e \'use strict\'\; \\n\\nconst sandbox = \'http://sandbox.bbc.co.uk\'\;\\n\\nmodule.exports = {\\n\ \ staticAssetsService: \`\${sandbox}:$PORT\`\\n}\; > $WORKSPACE/iplayer-web-dev-proxy/config/local.js ; }

ipl_setports() { INPUT=$* && echo -e \'use strict\'\; \\n\\nconst sandbox = \'http://sandbox.bbc.co.uk\'\;\\n\\nmodule.exports = {$INPUT}\; > $WORKSPACE/iplayer-web-dev-proxy/config/local.js ; }


alias ipl_atoz.p="ipl_atoz_setport"
alias ipl_boilerplate.p="ipl_boilerplate_setport"
alias ipl_features.p="ipl_features_setport"
alias ipl_guide.p="ipl_guide_setport"
alias ipl_highlights.p="ipl_highlights_setport"
alias ipl_homepage.p="ipl_homepage_setport"
alias ipl_lists.p="ipl_lists_setport"
alias ipl_programmes.p="ipl_programmes_setport"
alias ipl_playback.p="ipl_playback_setport"
alias ipl_webcomponents.p="ipl_webcomponents_setport"
alias ipl_storybook.p="ipl_storybook_setport"
alias ipl_discoveryservice.p="ipl_discoveryservice_setport"
alias ipl_staticassets.p="ipl_staticassets_setport"

alias ipl_startproxy="cd $WORKSPACE/iplayer-web-dev-proxy && nrd"

newtabi(){  
  osascript \
    -e 'tell application "iTerm2" to tell current window to set newWindow to (create tab with default profile)'\
    -e "tell application \"iTerm2\" to tell current session of newWindow to write text \"${@}\""
}


ipl_runapp() {
  app=$1
  port=$2
  case $app in
    iplayer-web-app-atoz ) newtabi "ipl_atoz && nrd $port" ;;
    iplayer-web-app-boilerplate ) newtabi "ipl_boilerplate && nrd $port" ;;
    iplayer-web-app-features ) newtabi "ipl_features && nrd $port" ;;
    iplayer-web-app-guide ) newtabi "ipl_guide && nrd $port" ;;
    iplayer-web-app-highlights ) newtabi "ipl_highlights && nrd $port" ;;
    iplayer-web-app-homepage ) newtabi "ipl_homepage && nrd $port" ;;
    iplayer-web-app-lists ) newtabi "ipl_lists && nrd $port" ;;
    iplayer-web-app-myprogrammes ) newtabi "ipl_programmes && nrd $port" ;;
    iplayer-web-app-playback-v2 ) newtabi "ipl_playback && nrd $port" ;;
    iplayer-web-components ) newtabi "ipl_webcomponents && nrd $port" ;;
    iplayer-web-components ) newtabi "ipl_storybook && nrd $port" ;;
    discoveryservice ) newtabi "ipl_discoveryservice && nrd $port" ;;
    staticassets ) newtabi "ipl_staticassets && nrd $port" ;;
  esac
}


ipl_test() {
    cd $WORKSPACE
    directories=$(find . -mindepth 1 -maxdepth 1 -type d  \( ! -iname ".*" \) | sed 's|^\./||g')

    if [[ ( ${#directories} == 0 ) ]]; then
        echo No directories found in $WORKSPACE;
    else
        repo_name=$*
        while [[ ${#repo_name} == 0 ]]; do
            cd $WORKSPACE
            cl && printf "\n\n\nPlease select an app to run:\n\n"
            select d in */; do test -n "$d" && break; echo ">>> Invalid Selection, please provide a valid number"; done
            repo_name=${d%%/}
        done
    fi

    cl && echo $'\n\n\n'"Repo name: $repo_name"$'\n\n\n\n\n\n'
}

ipl_run() {
    wp
    msg=""
    options=$(find . -mindepth 1 -maxdepth 1 -type d  \( ! -iname ".*" \) | sed 's|^\./||g')
    options=($options)

    menu() {
        cl
        echo "Choose apps to run:"
        nl
        for i in ${!options[@]}; do 
            printf "%3d%s) %s\n" $((i+1)) "${choices[i]:- }" "${options[i]}"
        done
        if [[ "$msg" ]]; then echo "$msg"; fi
    }

    prompt="Check an option (again to uncheck, ENTER when done): "
    while menu && nl && read -rp "$prompt" num && [[ "$num" ]]; do
        [[ "$num" != *[![:digit:]]* ]] &&
        (( num > 0 && num <= ${#options[@]} )) ||
        { msg="Invalid option: $num"; continue; }
        ((num--));
        [[ "${choices[num]}" ]] && choices[num]="" || choices[num]="+"
    done
    selected=()
    for i in ${!options[@]}; do 
        [[ "${choices[i]}" ]] && { item=$(printf " %s" "${options[i]}") && selected=("${selected[@]}" $item); msg=""; }
    done
    nl
    string=""
    num=0
    for index in ${!selected[@]}; do
        num=$index
    done
    ((num++))
    numSelected=$num
    numValidSelected=0
    numDone=0
    validSelected=()

    for app in ${selected[@]}; do
        case $app in
            iplayer-web-app-atoz ) ((numValidSelected++)); validSelected=("${validSelected[@]}" $app) ;;
            iplayer-web-app-boilerplate ) ((numValidSelected++)); validSelected=("${validSelected[@]}" $app) ;;
            iplayer-web-app-features ) ((numValidSelected++)); validSelected=("${validSelected[@]}" $app) ;;
            iplayer-web-app-guide ) ((numValidSelected++)); validSelected=("${validSelected[@]}" $app) ;;
            iplayer-web-app-highlights ) ((numValidSelected++)); validSelected=("${validSelected[@]}" $app) ;;
            iplayer-web-app-homepage ) ((numValidSelected++)); validSelected=("${validSelected[@]}" $app) ;;
            iplayer-web-app-lists ) ((numValidSelected++)); validSelected=("${validSelected[@]}" $app) ;;
            iplayer-web-app-myprogrammes ) ((numValidSelected++)); validSelected=("${validSelected[@]}" $app) ;;
            iplayer-web-app-playback-v2 ) ((numValidSelected++)); validSelected=("${validSelected[@]}" $app) ;;
            iplayer-web-components ) ((numValidSelected++)); validSelected=("${validSelected[@]}" $app) ;;
            discoveryservice ) ((numValidSelected++)); validSelected=("${validSelected[@]}" $app) ;;
            staticassets ) ((numValidSelected++)); validSelected=("${validSelected[@]}" $app) ;;
        esac
    done

    if (( $numValidSelected < 2)); then append=""; else append=","; fi

    ports=()
    defaultPorts=( 8080 8081 8082 8083 8084 8085 8086 8087 8088 8089 8090 8091 8092 8093 8094 8095 8096 8097 8098 8099 )

    # read "Use default ports? "
    # echo $useDefaultPorts

    for app in ${validSelected[@]}; do
        ((numDone++))
        if (( $numValidSelected == $numDone )); then append=""; fi
        nl
        read -rp "Port for $app: " port
        case $app in
            iplayer-web-app-atoz ) string=$string\\n$(echo -e atozFrontend: \`\${sandbox}:$port\`\\n)$append; ports=("${ports[@]}" $port) ;;
            iplayer-web-app-boilerplate ) string=$string\\n$(echo -e boilerplateFrontend: \`\${sandbox}:$port\`\\n)$append; ports=("${ports[@]}" $port) ;;
            iplayer-web-app-features ) string=$string\\n$(echo -e featuresFrontend: \`\${sandbox}:$port\`\\n)$append; ports=("${ports[@]}" $port) ;;
            iplayer-web-app-guide ) string=$string\\n$(echo -e guideFrontend: \`\${sandbox}:$port\`\\n)$append; ports=("${ports[@]}" $port) ;;
            iplayer-web-app-highlights ) string=$string\\n$(echo -e highlightsFrontend: \`\${sandbox}:$port\`\\n)$append; ports=("${ports[@]}" $port) ;;
            iplayer-web-app-homepage ) string=$string\\n$(echo -e homepageFrontend: \`\${sandbox}:$port\`\\n)$append; ports=("${ports[@]}" $port) ;;
            iplayer-web-app-lists ) string=$string\\n$(echo -e listsFrontend: \`\${sandbox}:$port\`\\n)$append; ports=("${ports[@]}" $port) ;;
            iplayer-web-app-myprogrammes ) string=$string\\n$(echo -e myprogrammesFrontend: \`\${sandbox}:$port\`\\n)$append; ports=("${ports[@]}" $port) ;;
            iplayer-web-app-playback-v2 ) string=$string\\n$(echo -e playbackFrontend: \`\${sandbox}:$port\`\\n)$append; ports=("${ports[@]}" $port) ;;
            iplayer-web-components ) string=$string\\n$(echo -e storybookFrontend: \`\${sandbox}:$port\`\\n)$append; ports=("${ports[@]}" $port) ;;
            discoveryservice ) string=$string\\n$(echo -e discoveryService: \`\${sandbox}:$port\`\\n)$append; ports=("${ports[@]}" $port) ;;
            staticassets ) string=$string\\n$(echo -e staticAssetsService: \`\${sandbox}:$port\`\\n)$append; ports=("${ports[@]}" $port) ;;
        esac
    done

    string=$string\\n
    ipl_setports $string
    nl

    for i in ${!validSelected[@]}; do
        ipl_runapp ${validSelected[i]} ${ports[i]} 
    done

    ipl_startproxy
}


# other

export GPG_TTY=$(tty)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# finish with clear

c
