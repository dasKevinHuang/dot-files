set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.fzf
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
              "call vundle#begin('~/some/path     /he r   e')

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
"Syntastic"
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'valloric/youcompleteme'
Plugin 'ternjs/tern_for_vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'vim-latex/vim-latex'
Plugin 'leafgarland/typescript-vim'
let g:tex_flavor='latex'
set grepprg=grep\ -nH\ $*


" Basic settings
set nocompatible "Fixes old Vi bugs
syntax on
set backspace=2 "Makes backspace work
set history=500 "Sets undo history size
set ruler "Sets up status bar
set laststatus=2 "Always keeps the status bar active
set number "Turns on line numbering
set t_Co=256 "Sets Vim to use 256 colors
set relativenumber

filetype plugin on
let mapleader = ","

" Indentation settings
set tabstop=2 "Sets display width of tabs
set softtabstop=2
set shiftwidth=2 "Sets indentation width
set autoindent "Turns on auto-indenting
" set smartindent "Remembers previous indent when creating new lines
set lazyredraw
set ttyfast
imap <RightMouse> <Esc>
nmap <RightMouse> <Esc>
set mouse=a
set clipboard=unnamed
"
"Choose between tabs and spaces for indentation by uncommenting one of
"these two. Expand for spaces, noexpand for tabs:"
"set noexpandtab
set expandtab


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

syntax enable
set background=dark
let g:solarized_termcolors = 256
" colorscheme solarized
colorscheme darkblue

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
" nnoremap <C-n><C-n> :set number! number?<CR>
" nnoremap <C-n><C-r> :set relativenumber! relativenumber?<CR>
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_enable_highlighting = 1
let g:syntastic_enable_ballons = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

map <Leader>n :NERDTreeToggle<CR>
" for command mode
nnoremap <S-Tab> <<
nnoremap <Tab> >>
" " for insert mode
inoremap <S-Tab> <C-d>
" toggle spell check with <F5>
map <F5> :setlocal spell! spelllang=en_us<cr>
imap <F5> <ESC>:setlocal spell! spelllang=en_us<cr>
map <C-p> :GitFiles<cr>
map <C-l> :nohlsearch<CR>
set wildmenu
set wildmode=longest:list,full

" Fix for mouse detection
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end
" Turns on typescript autocompletion
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

let g:syntastic_typescript_checkers=['tslint', 'tsc']
let g:syntastic_typescript_tslint_exec="/usr/local/bin/tslint"
"Overrides ts type for typescript
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
