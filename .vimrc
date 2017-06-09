set nocompatible              " be iMproved, required
filetype off                  " required
set t_Co=256
syntax on
filetype plugin on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plug commands between vundle#begin/end.
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'Valloric/YouCompleteMe'
Plug 'majutsushi/tagbar'
Plug 'carakan/new-railscasts-theme'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-git'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plug 'L9'
" Git plugin not hosted on GitHub
Plug 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plug 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plug 'ascenator/L9', {'name': 'newL9'}
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug '/home/echaouchna/.fzf/bin/fzf' | Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'mbbill/undotree',             { 'on': 'UndotreeToggle'   }
Plug 'justinmk/vim-gtfo'

" All of your Plugins must be added before the following line
call plug#end()              " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plug stuff after this line
"
colorscheme new-railscasts
set laststatus=2
let g:airline_powerline_fonts = 1
map <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

" ----------------------------------------------------------------------------
" undotree
" ----------------------------------------------------------------------------
let g:undotree_WindowLayout = 2
nnoremap U :UndotreeToggle<CR>
