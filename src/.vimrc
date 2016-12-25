" Global .vimrc file
" Recommended location: ~/.vimrc
" A symbolic link to this file (and .vim folder) is recommended instead of hard copying: 
" ln -s /path/to/this/file ~/.vimrc
" ln -s /path/to/.vim/ ~/.vim

" Disable compatibility with VI-like editors.
" Useful for cross-platform operations (and Vundle).
set nocompatible

" Vundle setup. Git & curl is needed.
" Run this command:  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


"---------------Vundle--------------"
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" navigate through directories with a "-"
Plugin 'tpope/vim-vinegar'

" alternatively, a useful directory tree in the navbar
Plugin 'scrooloose/nerdtree'

" ag + greplace for fast search and replacing
Plugin 'rking/ag.vim'
Plugin 'skwp/greplace.vim'

"Works well in conjunction with existing text objects
Plugin 'tpope/vim-surround'

"Ease interaction with tmux from vim
Plugin 'benmills/vimux'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



"---------------Plugin Setup---------------"
"/NerdTree
let NERDTreeHijackNetrw = 0 
nnoremap <Leader><Leader> :NERDTreeToggle<cr>

"/Greplace

"ag
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

"ack
"set grepprg=ack
"let g:grep_cmd_opts = '--noheading'

"git grep
"set grepprg=git\ grep
"let g:grep_cmd_opts = '--line-number'


"---------------Basic Setup---------------"
"Enables syntax coloring
syntax enable 

"Make backspace move from current line
set backspace=indent,eol,start

"The default leader is \, but a comma is much better
"(Vim Mastery, video 3)
let mapleader=','

"Set relative number lines
set number
set relativenumber

"Tab setup as recommende on Vim Mastery, video 20
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4

"Set our desired autocompletion matching - Vim Mastery, 17
set complete=.,w,b,u


"Add new behaviour for wrapping lines
"Remaps j,k to gj, gk respectively if line wraps on more rows than one
"TODO This does not appear to work everywhere

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')




"---------------Visuals---------------"

if has('gui_running')
    set background=dark
    colorscheme solarized
else
    "colorscheme zenburn
endif

if has('gui_running')
    set linespace=15
    set guifont=Fira_Code:h17

    set guioptions-=e

    "Remove some bars
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R

    "Faking a custom left padding for window
    hi LineNr guibg=bg
    set foldcolumn=0
    hi foldcolumn guibg=bg
    "set nonumber
    hi vertsplit guifg=bg guibg=bg
endif



"---------------Search---------------"
set hlsearch "highlight searching
set incsearch "incremental highlight searching


"---------------Split Management---------------"
set splitbelow
set splitright

"Map new keys for splitting
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>


"---------------Mappings---------------"

"Quick map for accesing .vimrc file, in a new tab. You can use :tabc to close a tab.
nnoremap <Leader>ev :tabedit ${HOME}/.vimrc<cr> 
nnoremap <Leader><space> :nohlsearch<cr>

"---------------Auto-Commands---------------"


"Automatically source the Vimrc file on save. 
"Using a group to avoid accesing `autocmd` multiple times
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END


"zz - center the image
"C-w, | - expand a split
"C-w, C-= - equalize splits
"<Leader>f - tag a keyword
":tn - tag next
":tp - tag previous
"gt - navigate through tabs
