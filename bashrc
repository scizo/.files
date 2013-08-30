# Use vim style bash prompt
#set -o vi

# aliases
alias ls='ls -G'

alias stagedb='ssh stage-db1.totalcareauto.com -t mysql -u root -D tca_stage'
alias proddb='ssh db1.totalcareauto.com -t mysql -u root -D tca_production'
alias devdb='mysql -u root -D tca_development'

# bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  source `brew --prefix`/etc/bash_completion
fi
if [ -f `brew --prefix`/etc/profile.d/bash_completion.sh ]; then
  source `brew --prefix`/etc/profile.d/bash_completion.sh
fi
[[ -r .nvm/bash_completion ]] && . .nvm/bash_completion

parse_git_time() {
  git log --pretty=format:'%cr' --date=relative -1
}

function minutes_since_last_commit {
  now=`date +%s`
  last_commit=`git log --pretty=format:'%at' -1`
  seconds_since_last_commit=$((now-last_commit))
  minutes_since_last_commit=$((seconds_since_last_commit/60))
  echo $minutes_since_last_commit
}

NORMAL="\e[0m"
BLUE="\e[0;34m"
RED="\e[1;31m"
YELLOW="\e[0;33m"
MAGENTA="\e[1;35m"
GREEN="\e[0;32m"

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
      echo "${GIT_PROMPT} "
    else
      echo -e " "
    fi
  }
else
  git_prompt() {
    echo -e " "
  }
fi

# マ I thought this was an interesting character so I am keeping it around for now
export PS1='\[\e[0;36m\]\w\[\e[0m\]$(git_prompt)'

export PAGER=less
export EDITOR=vim
export HOMEBREW_CC="clang"
export RBENV_SILENCE_WARNINGS=1
export JRUBY_OPTS="--1.9"
export LEDGER_FILE='/Users/snielsen/Dropbox/books.ledger'

[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"
eval "$(rbenv init -)"

export PATH=".bin:$PATH"

# racket install in /Applications
export PATH="$PATH:/Applications/Racket v5.3.5/bin"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
