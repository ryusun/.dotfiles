#!/bin/sh

# install .dotfiles

sudo yum install git -y 
sudo yum install zsh -y 


git submodule update --init

echo "add ~/.zshrc"
[ -e ~/.zshrc ] && sudo rm -f ~/.zshrc
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc

echo "add ~/.vimrc"
[ -e ~/.vimrc ] && sudo rm -f ~/.vimrc
ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc

echo "add ~/.vim/bundle/neobundle"
[ -d ~/.vim ] || mkdir -p ~/.vim/bundle
ln -s ~/.dotfiles/vim/bundle/neobundle ~/.vim/bundle/neobundle

echo "finish setup"

exit

