# bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  source `brew --prefix`/etc/bash_completion
fi

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
BLUE="\e[1;36m"
RED="\e[1;31m"
YELLOW="\e[1;33m"
MAGENTA="\e[1;35m"
GREEN="\e[1;32m"

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
      local GIT_PROMPT=`__git_ps1 "${MAGENTA} → %s${NORMAL} ${SINCE_LAST_COMMIT}"`
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

export PS1='\[\e[1;36m\]\w\[\e[0m\]$(git_prompt)'

export EDITOR=vim
export HOMEBREW_LLVM=True

[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
