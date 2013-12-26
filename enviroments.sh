#!/bin/sh

# install .dotfiles

sudo yum install vim -y 
sudo yum install zsh -y 
sudo yum install tmux -y

git submodule update --init

echo "add ~/.zshrc"
[ -e ~/.zshrc ] && sudo rm -f ~/.zshrc
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc

echo "add ~/.vimrc"
[ -e ~/.vimrc ] && sudo rm -f ~/.vimrc
ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc

echo "add ~/.vim/bundle/neobundle"
[ -d ~/.vim/bundle ] || mkdir -p ~/.vim/bundle
[ -h ~/.vim/bundle/neobundle ] || ln -s ~/.dotfiles/vim/bin/neobundle ~/.vim/bundle/neobundle

[ -e ~/.tmux.conf ] && sudo rm -f ~/.tmux.conf
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf

echo "finish setup"

exit

