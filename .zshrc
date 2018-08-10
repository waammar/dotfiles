# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/echaouchna/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
#ZSH_THEME="spaceship"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
plugins=(
  git
  ubuntu
  sudo
  kubectl
  mvn
  npm
  node
  docker
  z
  go
  golang
  docker-compose
  tmux
  tmuxinator
  python
  git-flow
  git-extras
  nvm
  colored-man-pages
  per-directory-history
  command-not-found
  vault
)

plugins+=(k alias-tips zsh-completions zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

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

export PATH=$PATH:/snap/bin
export JAVA_HOME="/usr/lib/jvm/java-8-oracle"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NEXUS_USER=nabechao
export NEXUS_PASSWORD=Digitas2017
export NEXUS_EMAIL=nabil.echaouch@digitas.com
export NEXUS_PRIVATE_REPO='https://hub.sandbox.pfex.digitas.fr/repository/red-private-npm/'
export NEXUS_SCOPE=@red
export PATH=$PATH:/home/echaouchna/workspace/tools/Rambox-0.5.16

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH=$PATH:/home/echaouchna/workspace/tools/apache-maven-3.5.3/bin
export PATH=$PATH:/home/echaouchna/workspace/digitas/dev-tools
[[ $TMUX = "" ]] && export TERM="xterm-256color"
GOPATH="/home/echaouchna/go"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
alias tmux="/usr/local/bin/tmux"

HISTSIZE=999999999
SAVEHIST=999999999

setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.

function cless () {
   pygmentize -f terminal "$1" | less -R
}

function ccat () {
   pygmentize -f terminal "$1"
}

source ~/.oh-my-zsh/custom/plugins/kube-ps1/kube-ps1.sh
PROMPT='$(kube_ps1)'$PROMPT
#PROMPT=$PROMPT'$(kube_ps1)'
KUBE_PS1_SUFFIX=']'
KUBE_PS1_PREFIX='['
KUBE_PS1_SEPARATOR=''
KUBE_PS1_SYMBOL_USE_IMG='true'
KUBE_PS1_BG_COLOR='black'
KUBE_PS1_CTX_COLOR='magenta'
export PATH=$PATH:/home/echaouchna/.cargo/bin
alias watch='watch '
export PATH=$PATH:$GOPATH/bin
eval "$(direnv hook zsh)"
