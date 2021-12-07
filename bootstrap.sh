#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

THIS_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

function linkEmUp() {
  # link dofiles from bootstrap.sh directory to target directory
  ln --symbolic --force \
    "${THIS_DIR}/.editorconfig" \
    "${THIS_DIR}/.exports" \
    "${THIS_DIR}/.gitconfig" \
    "${THIS_DIR}/.gvimrc" \
    "${THIS_DIR}/.inputrc" \
    "${THIS_DIR}/.tmux.conf" \
    "${THIS_DIR}/.vimrc" \
    "${THIS_DIR}/.zshrc" \
    "${THIS_DIR}/.functions" \
    "${THIS_DIR}/.aliases" \
    "${THIS_DIR}/.extra" \
    ~
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
