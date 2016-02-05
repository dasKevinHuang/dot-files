set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"NERDTREE"
Plugin 'scrooloose/nerdtree'
"Airline"
Plugin 'bling/vim-airline'
"ctrlp"
Plugin 'ctrlpvim/ctrlp.vim'

"A simple vimrc that I give to people just starting to use Vim."
"Lines beginning with a double quote are comments."

" Basic settings
set nocompatible "Fixes old Vi bugs
syntax on
set backspace=2 "Makes backspace work
set history=500 "Sets undo history size
set ruler "Sets up status bar
set laststatus=2 "Always keeps the status bar active
set number "Turns on line numbering
set t_Co=256 "Sets Vim to use 256 colors


" Indentation settings
set tabstop=2 "Sets display width of tabs
set shiftwidth=2 "Sets indentation width
set autoindent "Turns on auto-indenting
set smartindent "Remembers previous indent when creating new lines
"
"Choose between tabs and spaces for indentation by uncommenting one of
"these two. Expand for spaces, noexpand for tabs:"
"set noexpandtab
"set expandtab


" Search settings
set hlsearch "Highlights search terms
set showmatch "Highlights matching parentheses
set ignorecase "Ignores case when searching
set smartcase "Unless you put some caps in your search term


" Key mappings
"Use jj instead of escape in insert mode
inoremap jj <Esc>`^


"Turn on plugin & indentation support for specific filetypes
filetype plugin indent on


" All of your Plugins must be added before the following line
call vundle#end()            " required
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
" Put your non-Plugin stuff after this line

" Use synax highlighting
syntax on

" For any filetype plugin use plugin-defined indenting
filetype plugin indent on

" Line wrap at 79
set textwidth=79

" When using > or <, for indent / outdent, go this many spaces
set shiftwidth=2

" Automatically display line numbers
set number

" Tab is never \t, but always tabstop number of spaces
set expandtab

" Tab is 2 spaces
set tabstop=2

" Allow me to change buffers without saving
set hidden

" Do not create backup files
set nobackup

" Do not create swap files
set noswapfile

" Be a good .git user
augroup gitcommit
  autocmd!
  au FileType gitcommit set tw=50
augroup END

" Reload .vimrc
nmap <Leader>s :exec "source ~/.vimrc\|echo 'Reloaded .vimrc'"<cr>

" Beautiful Magic: "jk" i insert mode returns you to Normal
inoremap jk <ESC>

" Toggle numbering modes
nnoremap <C-n><C-n> :set number! number?<CR>
nnoremap <C-n><C-r> :set relativenumber! relativenumber?<CR>
