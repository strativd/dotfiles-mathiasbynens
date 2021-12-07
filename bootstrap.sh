#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function linkEmUp() {
  ln .editorconfig ~/.editorconfig
  ln .exports ~/.exports
  ln .gitconfig ~/.gitconfig
  ln .gvimrc ~/.gvimrc
  ln .inputrc ~/.inputrc
  ln .tmux.conf ~/.tmux.conf
  ln .vimrc ~/.vimrc
  ln .zshrc ~/.zshrc
  ln .functions ~/.functions
  ln .aliases ~/.aliases
  ln .extra ~/.extra
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
