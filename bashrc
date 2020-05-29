# Use vim style bash prompt
#set -o vi

# aliases
alias ls='ls -G'

alias journal='vim $HOME/Dropbox/journal/`date "+%Y-%m-%d"`.txt.asc'

primary_addr="kafka-url-here"
primary_cluster="$HOME/.kafka/primary.properties"

alias kcg="kafka-consumer-groups --bootstrap-server $primary_addr --command-config $primary_cluster"

alias cl='env_name=$(cat environment.yml | shyaml get-value name); conda activate $env_name && echo activated $env_name'

alias tn='tmux new-session -s'
alias tl='tmux list-sessions'
alias ta='tmux attach -t'

_tmux_alias_completions()
{
  if [ "${#COMP_WORDS[@]}" != "2" ]; then
    return
  fi

  COMPREPLY=($(compgen -W "$(tmux list-sessions | sed -E 's/([^\:]*):.*/\1/')" -- "${COMP_WORDS[1]}"))
}

complete -F _tmux_alias_completions ta

alias kc='kubectl'

if command -v nvim >/dev/null 2>&1; then
  alias vim=nvim
fi

# bash completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

for f in "$HOME"/.bash.d/*; do
  [ -r "$f" ] && source "$f"
done

function csv_summary {
  echo "summary(read.csv('$1'))" | r --slave --vanilla --quiet --no-save
}

function tsv_summary {
  echo "summary(read.csv('$1',sep='\t'))" | r --slave --vanilla --quiet --no-save
}

parse_git_time() {
  git log --pretty=format:'%cr' --date=relative -1
}

function minutes_since_last_commit {
  now=`date +%s`
  last_commit=`git log --pretty=format:'%ct' -1`
  seconds_since_last_commit=$((now-last_commit))
  minutes_since_last_commit=$((seconds_since_last_commit/60))
  echo $minutes_since_last_commit
}

tput init

NORMAL="\001$(tput sgr0)\002"
BLUE="\001$(tput setaf 4)\002"
RED="\001$(tput setaf 1; tput bold)\002"
YELLOW="\001$(tput setaf 3)\002"
MAGENTA="\001$(tput setaf 5; tput bold)\002"
GREEN="\001$(tput setaf 2)\002"

__gitdir ()
{
  if [ -z "${1-}" ]; then
    if [ -n "${__git_dir-}" ]; then
      echo "$__git_dir"
    elif [ -n "${GIT_DIR-}" ]; then
      test -d "${GIT_DIR-}" || return 1
      echo "$GIT_DIR"
    elif [ -d .git ]; then
      echo .git
    else
      git rev-parse --git-dir 2>/dev/null
    fi
  elif [ -d "$1/.git" ]; then
    echo "$1/.git"
  else
    echo "$1"
  fi
}

if [ `type -t __gitdir`"" == 'function' ]; then
  git_prompt() {
    local g="$(__gitdir)"
    if [ -n "$g" ]; then
      local MINUTES_SINCE_LAST_COMMIT=`minutes_since_last_commit`
      if [ "$MINUTES_SINCE_LAST_COMMIT" -gt 30 ]; then
        local COLOR=${RED}
      elif [ "$MINUTES_SINCE_LAST_COMMIT" -gt 10 ]; then
        local COLOR=${YELLOW}
      else
        local COLOR=${GREEN}
      fi
      local SINCE_LAST_COMMIT="${COLOR}$(parse_git_time)${NORMAL}"
      # The __git_ps1 function inserts the current git branch where %s is
      local GIT_PROMPT=`__git_ps1 "${MAGENTA} %s${NORMAL} ${SINCE_LAST_COMMIT}"`
      echo "${GIT_PROMPT}"
    else
      echo ""
    fi
  }
else
  git_prompt() {
    echo ""
  }
fi

complete -C aws_completer aws

#export PS1='\[$(tput setaf 4)\]\w\[$(tput sgr0)\]$(git_prompt)\[$(tput setaf 6)\] ∇  \[$(tput sgr0)\]'
export PS1='\[$(tput setaf 6)\]\w\[$(tput sgr0)\]$(git_prompt) '

export HISTCONTROL=ignoreboth # ignorespace and ignoredups
export HISTIGNORE='ls:bg:fg:history'
export HISTSIZE=200000
shopt -s histappend
shopt -s cmdhist

export PAGER="less -R"
export EDITOR=nvim
export HOMEBREW_CC="clang"
export RBENV_SILENCE_WARNINGS=1
export VIRTUAL_ENV_DISABLE_PROMPT=1
export JRUBY_OPTS="--1.9"
export LEDGER_FILE=$HOME/Dropbox/books.ledger

if [ -e /usr/libexec/java_home ]; then
  export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
fi

export GPGKEY=B40CC37E

#eval $(direnv hook bash)

# stack (haskell) installs bins to ~/.local/bin
export PATH="$HOME/.local/bin:$PATH"

export CLOUDSDK_PYTHON=/usr/bin/python3
export PATH=$PATH:/opt/google-cloud-sdk/bin
source /opt/google-cloud-sdk/completion.bash.inc

source <(kubectl completion bash)
eval $(complete | grep kubectl | sed s/kubectl$/kc/)

export PATH=$HOME/.miniconda3/bin:$PATH
export PATH=$PATH:$HOME/.go/bin

export PATH=".bin:$HOME/bin:$PATH"
export BOOT_JVM_OPTIONS="-client -XX:+TieredCompilation -XX:TieredStopAtLevel=1 -Xmx8g -XX:+CMSClassUnloadingEnabled -Xverify:none"
#export BOOT_CLOJURE_VERSION="1.7.0"
export SBT_OPTS="-XX:MaxPermSize=256m -Xmx1024m"

#export ANDROID_HOME=/usr/local/opt/android-sdk

export WECHALLUSER=smniel
export WECHALLTOKEN=DF7F8-947BA-ACF55-89C1A-0A48E-6C80E

# OPAM configuration
. /Users/scott/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# added by travis gem
[ -f /Users/scott.nielsen/.travis/travis.sh ] && source /Users/scott.nielsen/.travis/travis.sh

export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH="$PATH:$HOME/.cargo/bin"

export NPM_PACKAGES="$HOME/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH="$PATH:$HOME/.npm-packages/bin"

export SKIP_PLATELET_API_CHECK=1

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source $HOME/.griphook/env

KT_BROKERS=pkc-ep8k4.us-east4.gcp.confluent.cloud:9092
