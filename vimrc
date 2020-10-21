" PLUGIN (Vundle)

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" vim-code-dark
Plugin 'tomasiser/vim-code-dark'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'Yggdroot/indentLine'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Colorscheme

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line




" MAIN SETTING
set encoding=utf-8

set t_Co=256

set nobackup
set nowritebackup
set noswapfile
set ruler
set showcmd
set incsearch
set laststatus=2

" Auto-clear extra whitespace F5
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" Open new split panes to right-bottom
set splitbelow
set splitright

" Always use vertical diffs
set diffopt+=vertical

" Show extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" colorscheme codedark
colorscheme codedark

set colorcolumn=80
highlight ColorColumn ctermbg=darkred guibg=darkred
highlight Normal ctermfg=black ctermbg=lightgrey

" Numbers
set number
set numberwidth=5

" Folder
set foldlevel=99

let g:SimpylFold_docstring_preview=1

set bg=dark

set path=.,,**
setglobal complete-=t

set hidden

set wildignore+=

let g:netrw_banner = 0

let g:netrw_liststyle = 3

:set shell=/usr/bin/zsh

set mouse=a

inoremap jj <ESC>

syntax on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

set backspace=2
"set cursorcolumn
"set cursorline

map <C-n> :NERDTreeToggle<CR>

" If installed using git
set rtp+=~/.fzf

" Cycling buffers <TAB>
nnoremap <Tab> :bnext<CR>
nnoremap <A-Tab> :bp<CR>

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
" au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start

"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"use space to open folds
nnoremap <space> za
"----------Stop python PEP 8 stuff--------------

" Highlight VISUAL selection
highlight Visual cterm=reverse ctermbg=none

" Highlight enclosing brackets
highlight MatchParen cterm=bold ctermbg=green ctermfg=blue
set showmatch
