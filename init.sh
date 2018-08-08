#/bin/bash

DATE=$(date '+%Y-%m-%d_%H:%M:%S:%N')

dnfInstall() {
    dnf install zsh
    dnf install vim
    dnf install util-linux-user
    # ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
    # PATH="$HOME/.linuxbrew/bin:$PATH"
    # echo 'export PATH="$HOME/.linuxbrew/bin:$PATH"' >>~/.zshrc
    dnf install direnv
    dnf install tmux
}

backup() {
    file=$1
    [ -f $file ] && cp -L $file ${file}.bak.${DATE} && rm -f $file
}

if [ "$OSTYPE" = "linux-gnu" ]
then
    which dnf
    if [[ $? -eq 0 ]]
    then
        dnfInstall
    fi
elif [ "$OSTYPE" = "darwin"* ]
then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install aria2 gcc go httpie micro openssl youtube-dl nvm tmux direnv
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
backup ${HOME}/.zshrc
ln -sf $(pwd)/.zshrc ${HOME}/.zshrc

git clone https://github.com/djui/alias-tips.git ~/.oh-my-zsh/custom/plugins/alias-tips
git clone https://github.com/supercrabtree/k ~/.oh-my-zsh/custom/plugins/k
git clone git@github.com:jonmosco/kube-ps1.git ~/.oh-my-zsh/custom/plugins/kube-ps1
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions


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
