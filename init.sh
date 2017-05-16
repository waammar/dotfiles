#/bin/bash

#dnf install zsh
#dnf install util-linux-user
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/djui/alias-tips.git ~/.oh-my-zsh/custom/plugins/alias-tips
git clone https://github.com/supercrabtree/k ~/.oh-my-zsh/custom/plugins/k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting


#dnf install vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/bundle
# git clone git://git.wincent.com/command-t.git ~/.vim/bundle/command-t
# git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
# git clone https://github.com/scrooloose/nerdcommenter.git ~/.vim/bundle/nerdcommenter
# git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
# git clone https://github.com/carakan/new-railscasts-theme.git ~/.vim/bundle/new-railscasts-theme
# git clone https://github.com/rstacruz/sparkup.git ~/.vim/bundle/sparkup
# git clone https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic
# git clone https://github.com/majutsushi/tagbar.git ~/.vim/bundle/tagbar
# git clone https://github.com/vim-airline/vim-airline.git ~/.vim/bundle/vim-airline
# git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
# git clone https://github.com/tpope/vim-git.git ~/.vim/bundle/vim-git
# git clone https://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter
# git clone https://github.com/tpope/vim-surround.git ~/.vim/bundle/vim-surround
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe


#Fedora
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
PATH="$HOME/.linuxbrew/bin:$PATH"
echo 'export PATH="$HOME/.linuxbrew/bin:$PATH"' >>~/.zshrc
dnf install direnv

#Mac
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install aria2 gcc go httpie micro openssl youtube-dl nvm



cd && git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .


#==> Next steps:
#- Install the Linuxbrew dependencies:
#  Debian, Ubuntu, etc.
#    sudo apt-get install build-essential
#  Fedora, Red Hat, CentOS, etc.
#    sudo yum groupinstall 'Development Tools'
#  See http://linuxbrew.sh/#dependencies for more information.
#- Add Linuxbrew to your ~/.bash_profile by running
#    echo 'export PATH="/home/echaouchna/.linuxbrew/bin:$PATH"' >>~/.bash_profile
#    echo 'export MANPATH="/home/echaouchna/.linuxbrew/share/man:$MANPATH"' >>~/.bash_profile
#    echo 'export INFOPATH="/home/echaouchna/.linuxbrew/share/info:$INFOPATH"' >>~/.bash_profile
#- Add Linuxbrew to your PATH
#    PATH="$HOME/.linuxbrew/bin:$PATH"
#- We recommend that you install GCC by running:
#    brew install gcc
#- Run `brew help` to get started
#- Further documentation: 
#    http://docs.brew.sh
