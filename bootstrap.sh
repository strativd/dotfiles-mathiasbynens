#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

function linkEmUp() {
  ln -sf "$SCRIPT_DIR/.editorconfig" ~/.editorconfig
  ln -sf "$SCRIPT_DIR/.exports" ~/.exports
  ln -sf "$SCRIPT_DIR/.gitconfig" ~/.gitconfig
  ln -sf "$SCRIPT_DIR/.gvimrc" ~/.gvimrc
  ln -sf "$SCRIPT_DIR/.inputrc" ~/.inputrc
  ln -sf "$SCRIPT_DIR/.tmux.conf" ~/.tmux.conf
  ln -sf "$SCRIPT_DIR/.vimrc" ~/.vimrc
  ln -sf "$SCRIPT_DIR/.zshrc" ~/.zshrc
  ln -sf "$SCRIPT_DIR/.functions" ~/.functions
  ln -sf "$SCRIPT_DIR/.aliases" ~/.aliases
  ln -sf "$SCRIPT_DIR/.extra" ~/.extra
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  linkEmUp;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    linkEmUp;
  fi;
fi;

if [ $SPIN ]; then
  linkEmUp
  # set tmux source file
  tmux source-file ~/.tmux.conf
  # make packages available inside spin workspace
  sudo apt-get install -y htop
fi;

unset linkEmUp;
