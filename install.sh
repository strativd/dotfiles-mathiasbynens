# copy dotfiles into spin workspace
cp .gitconfig ~/.gitconfig
cp .tmux.conf ~/.tmux.conf
cp .zshrc ~/.zshrc

# set tmux source file
tmux source-file ~/.tmux.conf

# make packages available inside spin workspace
sudo apt-get install -y htop
