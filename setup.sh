if [ ! -d "$HOME/.tmp" ]; then
  mkdir $HOME/.tmp
fi

dir=$(cd "$(dirname "$BASH_SOURCE")"; pwd)

if [ $# -eq 0 ]; then
  files=$(ls $dir | grep -v 'setup.sh' | grep -v '.gitignore' | grep -v '.gitmodules' | grep -v 'init.vim' | grep -v 'clojure' | grep -v 'ghostty' | grep -v 'tmux')
else
  files=$@
fi

for file in $files; do
  if [ -e "$HOME/.$file" ]; then
    echo ".$file exists ... skipping"
  else
    echo "linking $file"
    ln -s $dir/$file $HOME/.$file
  fi
done

if [ -e "$HOME/.config/nvim/init.vim" ]; then
  echo ".config/nvim/init.vim exists ... skipping"
else
  echo "linking init.vim"
  mkdir -p $HOME/.config/nvim
  ln -s $dir/init.vim $HOME/.config/nvim/init.vim
fi

if [ -e "$HOME/.config/clojure" ]; then
  echo ".config/clojure exists ... skipping"
else
  echo "linking clojure"
  ln -s $dir/clojure $HOME/.config/clojure
fi

if [ -e "$HOME/.config/ghostty" ]; then
  echo ".config/ghostty exists ... skipping"
else
  echo "linking ghostty"
  ln -s $dir/ghostty $HOME/.config/ghostty
fi

if [ -e "$HOME/.config/tmux" ]; then
  echo ".config/tmux exists ... skipping"
else
  echo "linking tmux"
  ln -s $dir/tmux $HOME/.config/tmux
fi
