# https://github.com/mathiasbynens/dotfiles/blob/master/.aliases
# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME=/usr/local/Cellar/android-sdk/24.1.2
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin


alias gbi='git browse --issues'

alias pyserver='python -m SimpleHTTPServer'

alias start_redis='redis-server /usr/local/etc/redis.conf'
alias startmemcache='memcached -d'


alias nombomb='npm cache clear && bower cache clean && rm -rf node_modules bower_components dist tmp && npm install && bower install'
alias nombom=nombomb

alias jbomb='git pull origin develop && bundle && ber db:migrate && rails s'

eval "$(hub alias -s)"

alias grhh='git reset --hard HEAD'

# Git branch in prompt.

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

print_before_the_prompt () {
    printf "\n$txtpur%s $txtpur%s\n$txtrst" "$PWD"
}

alias gs='git status '
alias co='git checkout '
alias gpod='git push origin develop'
alias gpulld='git pull origin develop'

alias ber='bundle exec rake '
alias be='bundle exec '
alias rs='bundle exec rails s '
alias frr='foreman run rake '

# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
source ~/.git-completion.bash
# https://raw.githubusercontent.com/github/hub/master/etc/hub.bash_completion.sh
source ~/.hub.bash_completion.sh

PROMPT_COMMAND=print_before_the_prompt
PS1="\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

alias tmux="TERM=screen-256color-bce tmux"
