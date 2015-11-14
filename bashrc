# Use vim style bash prompt
#set -o vi

# aliases
alias ls='ls -G'

alias journal='vim $HOME/Dropbox/journal/`date "+%Y-%m-%d"`.txt.asc'

# bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  source `brew --prefix`/etc/bash_completion
fi
if [ -f `brew --prefix`/etc/profile.d/bash_completion.sh ]; then
  source `brew --prefix`/etc/profile.d/bash_completion.sh
fi
[[ -r .nvm/bash_completion ]] && . .nvm/bash_completion

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

#export PS1='\[$(tput setaf 4)\]\w\[$(tput sgr0)\]$(git_prompt)\[$(tput setaf 6)\] ∇  \[$(tput sgr0)\]'
export PS1='\[$(tput setaf 6)\]\w\[$(tput sgr0)\]$(git_prompt) '

export HISTSIZE=20000
shopt -s histappend

export PAGER=less
export EDITOR=vim
export HOMEBREW_CC="clang"
export RBENV_SILENCE_WARNINGS=1
export VIRTUAL_ENV_DISABLE_PROMPT=1
export JRUBY_OPTS="--1.9"
export LEDGER_FILE=$HOME/Dropbox/books.ledger
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`

export GPGKEY=B40CC37E

eval "$($HOME/.rbl/bin/rbl init -)"
#eval "$(pyenv init -)"
#eval "$(rbenv init -)"

[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"

# stack (haskell) installs bins to ~/.local/bin
export PATH="$HOME/.local/bin:$PATH"

export PATH=/opt/anaconda/bin:$PATH

export PATH=".bin:$PATH"
export BOOT_JVM_OPTIONS="-client -XX:+TieredCompilation -XX:TieredStopAtLevel=1 -Xmx8g -XX:MaxPermSize=128m -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -Xverify:none"
export BOOT_CLOJURE_VERSION="1.7.0"
export SBT_OPTS="-XX:MaxPermSize=256m -Xmx1024m"

#export ANDROID_HOME=/usr/local/opt/android-sdk

export WECHALLUSER=smniel
export WECHALLTOKEN=DF7F8-947BA-ACF55-89C1A-0A48E-6C80E

# OPAM configuration
. /Users/scott/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
