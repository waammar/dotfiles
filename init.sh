#!/bin/bash

DATE=$(date '+%Y-%m-%d_%H:%M:%S:%N')

dnfInstall() {
    sudo dnf install -y zsh vim util-linux-user direnv tmux
    # ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
    # PATH="$HOME/.linuxbrew/bin:$PATH"
    # echo 'export PATH="$HOME/.linuxbrew/bin:$PATH"' >>~/.zshrc
}

aptInstall() {
    sudo apt update
    sudo apt install -y zsh vim direnv tmux fonts-powerline
}

pacmanInstall() {
    # TODO: add commands
    return 0
}

backup() {
    file=$1
    [ -f $file ] && cp -L $file ${file}.bak.${DATE} && rm -f $file
}

os=''

if [ "$OSTYPE" = "linux-gnu" ]
then
    os=$(tr '[:upper:]' '[:lower:]' <<< $(lsb_release -i | awk '{print $NF}'))
    which dnf && dnfInstall
    which apt-get && aptInstall
    which pacman && pacmanInstall
elif [ "$OSTYPE" = "darwin"* ]
then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install aria2 gcc go httpie micro openssl youtube-dl nvm tmux direnv kubernetes-cli
    brew link --overwrite kubernetes-cli
    brew cask install iterm2
    os=osx
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
os_plugin='unknown_os'
if [[ -d ${HOME}/.oh-my-zsh/plugins/${os} ]]
then
    os_plugin=$os
else
    os_plugin=''
fi
backup ${HOME}/.zshrc
sed "s/__os_plugin__/${os_plugin}/" .zshrc > .zshrc_${os_plugin}
ln -sf $(pwd)/.zshrc_${os_plugin} ${HOME}/.zshrc

git clone https://github.com/djui/alias-tips.git ~/.oh-my-zsh/custom/plugins/alias-tips
#git clone https://github.com/supercrabtree/k.git ~/.oh-my-zsh/custom/plugins/k
git clone https://github.com/jonmosco/kube-ps1.git ~/.oh-my-zsh/custom/plugins/kube-ps1
git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions


curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

backup ${HOME}/.vimrc
ln -sf $(pwd)/.vimrc ${HOME}/.vimrc

vim +silent +VimEnter +PlugInstall +qall

git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf
backup ${HOME}/.tmux.conf.local
ln -sf $(pwd)/.tmux.conf.local ${HOME}/.tmux.conf.local


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
