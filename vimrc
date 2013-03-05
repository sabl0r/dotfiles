" load pathogen
execute pathogen#infect()

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

set t_Co=256				" use 256 colors
colorscheme wombat256mod	" theme	

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
set undofile						" use undo files
set undodir=~/.vim/files/undo		" don't save undo files to .
set nobackup						" don't create backup files

" bindings
map <C-n> :tabnext<CR>	" ctrl + n switches to next tab

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

" powerline
set rtp+=/usr/lib64/python2.7/site-packages/powerline/bindings/vim
set guifont=Consolas:h9

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

