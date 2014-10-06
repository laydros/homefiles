# Prerequisites:
# (Ubuntu) sudo apt-get build-dep vim
# (OSX) Command Line Tools for Xcode

hg clone https://vim.googlecode.com/hg/ vim
cd vim/src
./configure --enable-pythoninterp --with-features=huge --prefix=$HOME/opt/vim
make && make install
mkdir -p $HOME/bin
cd $HOME/bin
ln -s $HOME/opt/vim/bin/vim
which vim
vim --version

# on Ubuntu:
sudo apt-get install gtk2-engines-pixbuf
