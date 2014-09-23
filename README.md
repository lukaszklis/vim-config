vimfiles
==========

Vim's config. WIP.

Steps to install dotfiles:

1. Clone the repo ``cd ~ && git clone git@github.com:lukaszklis/vimfiles.git``
2. Create symlinks for vim’s files: ``ln -s ~/vimfiles/vim ~/.vim && ln -s ~/vimfiles/vimrc ~/.vimrc``
3. [Install NeoBundle](https://github.com/Shougo/neobundle.vim#1-install-neobundle)
4. Install bundles: ``vim ~/.vimrc``. Enter the following in Vim: ``:NeoBundleInstall``
5. Enjoy! :)
