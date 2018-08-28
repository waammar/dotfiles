#!/bin/bash

DATE=$(date '+%Y-%m-%d_%H:%M:%S:%N')
BACKUP_DIR=${HOME}/.backup_zsh_dir

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
    local file=$1
    mkdir ${BACKUP_DIR} 2>/dev/null
    [ -f $file ] && cp -L $file ${BACKUP_DIR}/$(basename ${file}).bak.${DATE} && rm -f $file
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
    brew install aria2 ctags gcc go httpie micro openssl youtube-dl nvm tmux direnv kubernetes-cli
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
ln -sf $(pwd)/.zsh_application_specific ${HOME}/.zsh_application_specific

git clone https://github.com/djui/alias-tips.git ~/.oh-my-zsh/custom/plugins/alias-tips
#git clone https://github.com/supercrabtree/k.git ~/.oh-my-zsh/custom/plugins/k
git clone https://github.com/jonmosco/kube-ps1.git ~/.oh-my-zsh/custom/plugins/kube-ps1
git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k


curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

backup ${HOME}/.vimrc
ln -sf $(pwd)/.vimrc ${HOME}/.vimrc

vim +silent +VimEnter +PlugInstall +qall

git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf
backup ${HOME}/.tmux.conf.local
ln -sf $(pwd)/.tmux.conf.local ${HOME}/.tmux.conf.local
