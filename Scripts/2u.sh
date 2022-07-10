# File: 2u.sh


pip3 install --user virtualenvwrapper
mkdir ~/.vim
cd ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git\
    ~/.vim/bundle/Vundle.vim
cd bundle
git clone https://github.com/alvan/vim-closetag
cd

cp ~/Notes/Installs/Vim/vimrc  ~/.vimrc
cp ~/Notes/Installs/bashrc ~/.bashrc
