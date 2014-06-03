#!/bin/sh

# install .dotfiles

# add rpm epel

if rpm -qa | grep epel ; then
	 echo "epel already exists.do nothing." 
 else 
	 sudo rpm -ivh http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
fi

# add software

sudo yum install vim -y 
sudo yum install zsh -y 
sudo yum install tmux -y

git submodule update --init

# add symbolic link

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

# add working directory

[ -d ~/src ]  || mkdir -p ~/src/git
[ -d ~/work ] || mkdir -p ~/work
[ -d ~/tmp ]  || mkdir -p ~/tmp

bashfile=~/.bashrc

if ! cat $bashfile | grep -qa tmux ; then

    echo "tmux_bin=\`which tmux\`" >> $bashfile
    echo "zsh_bin=\`which zsh\`" >> $bashfile

    echo "if [ ! -z \$tmux_bin ]; then" >> $bashfile
    echo "    \$tmux_bin " >> ~/.bashrc
    echo "elif [ ! -z \$zsh_bin ]; then" >> $bashfile
    echo "    \$zsh_bin" >> $bashfile
    echo "fi" >> $bashfile
fi

echo "finish setup"

exit

