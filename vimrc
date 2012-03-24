" user interface
set number			" show line numbers
set showtabline=2		" always show tabline

set t_Co=256			" use 256 colors
colorscheme wombat256mod	" theme	

syntax on			" syntax highlighting

" indention
filetype on
filetype plugin on		
filetype indent on
set autoindent

" tabs & spaces
set tabstop=4			" tabs have a width of 4 spaces
set shiftwidth=4		" idention of 4 spaces
set noexpandtab			" use tabs instead of spaces

" activate wildmenu
set wildmenu
set wildmode=list:longest,full

" search
set hlsearch			" highlight search terms
set incsearch			" incremental searching
set ignorecase			" searches are case insensitive ...
set smartcase			" ... unless they contain at least one capital letter

" bindings
map <C-n> :tabnext<CR>		" ctrl + n switches to next tab

" keep cursor position while navigating through lines
nmap <silent> j gj
nmap <silent> k gk
map <silent> <Up> gk
imap <silent> <Up> <C-o>gk
map <silent> <Down> gj
imap <silent> <Down> <C-o>gj

" home and end jump to the beginning and end of the current line as it is
" wrapped
map <silent> <home> g<home>
imap <silent> <home> <C-o>g<home>
map <silent> <End> g<End>
imap <silent> <End> <C-o>g<End>

" reselect visual block after indent / outdent
vnoremap < <gv
vnoremap > >gv

