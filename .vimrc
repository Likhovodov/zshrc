set number
set tabstop=4
set shiftwidth=4
set number relativenumber

" Enable autocomplete
set wildmode=longest,list,full

" Disable auto commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits new windows on right and below
set splitbelow splitright

" Shortcutting split nav
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Preserve cursor position apon exit
source $VIMRUNTIME/vimrc_example.vim

" Backup file location (swp, ~, .un~)
set backupdir=~/.vimstuff//
set directory=~/.vimstuff//
set undodir=~/.vimstuff//
