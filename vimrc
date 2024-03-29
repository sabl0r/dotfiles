" load Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vim plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'rhlobo/vim-super-retab'
Plugin 'preservim/nerdcommenter'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'dense-analysis/ale'
Plugin 'nordtheme/vim'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'

call vundle#end()

" user interface
set number				" show line numbers
set showtabline=2		" always show tabline
set laststatus=2		" always show status line
set noshowmode			" disable default vim mode text
set backspace=2			" allow backspacing over everything in insert mode
set history=1000		" command history size
set scrolloff=1			" keep one line above and below current scroll position
set sidescrolloff=5		" keep 5 columns to the left and right
set showcmd				" show command in the last line
set display+=lastline	" display as much as possible of the last line in a window
set cursorline			" highlight current line
set cursorcolumn		" highlight current column
set hidden				" enable switching from modified but not yet saved buffers

set t_Co=256				" use 256 colors
colorscheme nord		" theme

syntax on	" syntax highlighting

set encoding=utf-8	" encoding

set autoread	" auto reload changed files

" indention
filetype on
filetype plugin on
filetype indent on
set autoindent

" tabs & spaces
set tabstop=4		" tabs have a width of 4 spaces
set shiftwidth=4	" idention of 4 spaces
set noexpandtab		" use tabs instead of spaces

" activate wildmenu
set wildmenu
set wildmode=list:longest,full

" search
set hlsearch	" highlight search terms
set incsearch	" incremental searching
set ignorecase	" searches are case insensitive ...
set smartcase	" ... unless they contain at least one capital letter

" files
set directory=~/.vim/files/swap		" don't save swap files to .

if v:version >= 703
	set undofile						" use undo files
	set undodir=~/.vim/files/undo		" don't save undo files to .
endif

set nobackup						" don't create backup files

" bindings

" Set leader to space instead of \
let mapleader = " "

nnoremap <CR> :noh<CR><CR> " Clear highlighted search results

nmap <F12> :set invnumber<CR> " toggle line numbers

" set keycodes for PuTTY
set <s-right>=[C
set <s-left>=[D

" tab navigation
nnoremap <s-right> :tabnext<CR> " shift + right
nnoremap <s-left> :tabprev<CR>  " shift + left
nnoremap <c-n> :tabnext<CR> " ctrl + n (shift not working in tmux)
nnoremap <c-c> :tabprev<CR> " ctrl + c (shift not working in tmux)

" keep cursor position while navigating through lines
nmap <silent> j gj
nmap <silent> k gk
map <silent> <Up> gk
imap <silent> <Up> <C-o>gk
map <silent> <Down> gj
imap <silent> <Down> <C-o>gj

" home and end jump to the beginning and end of the current line as it is wrapped
map <silent> <home> g<home>
imap <silent> <home> <C-o>g<home>
map <silent> <End> g<End>
imap <silent> <End> <C-o>g<End>

" reselect visual block after indent / outdent
vnoremap < <gv
vnoremap > >gv

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" disable ESC delay caused by powerline
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" disable .netrwhist file
let g:netrw_dirhistmax=0

if filereadable(glob("~/.dotfiles/vimrc.local"))
	source ~/.dotfiles/vimrc.local
endif

" bracketed paste mode
if &term =~ "xterm.*\\\|screen.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map  <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif

" automatically disable 'paste' mode when leaving insert mode.
if has("autocmd") && exists('##InsertLeave')
    autocmd InsertLeave * set nopaste
endif

" Remove trailing whitespaces
nnoremap <Leader>r :StripWhitespace<CR>

" NERD Commenter
let g:NERDCompactSexyComs=1

" ALE
let g:airline#extensions#ale#enabled = 1
"let g:ale_linters_explicit = 1
let g:ale_linters = {
\	'php': ['php'],
\	'javascript': []
\}

