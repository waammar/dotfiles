# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/echaouchna/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages fedora sudo npm mvn per-directory-history z docker docker-compose dnf tmux tmuxinator python git-flow git-extras)
plugins+=(k alias-tips zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH="$HOME/.linuxbrew/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export XDG_DATA_DIRS="/home/echaouchna/.linuxbrew/share:$XDG_DATA_DIRS"
HISTSIZE=999999999
SAVEHIST=999999999
source $HOME/.ssh_hosts/.wrapper_fzf.sh
export GOPATH="/home/echaouchna/go"
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export EDITOR=vim
export CATALINA_HOME=$HOME/workspace/cloudwatt/tools/apache-tomcat-7.0.77
export JBILLING_WEBAPPS=$CATALINA_HOME/webapps/jbilling
export JBILLING_HOME=$HOME/workspace/cloudwatt/applications/jbilling/conf
export MAVEN_OPTS="-Xmx2G -XX:MaxPermSize=512m"
export HORIZON_HOME="/home/echaouchna/workspace/cloudwatt/applications/horizon"

function cless () {
    pygmentize -f terminal "$1" | less -R
}

export NVM_DIR="$HOME/.nvm"
. "/home/echaouchna/.linuxbrew/opt/nvm/nvm.sh"
eval "$(direnv hook zsh)"

show_virtual_env() {
  if [ -n "$VIRTUAL_ENV" ]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}

PS1='$(show_virtual_env)'$PS1
