" ==================================================
" .vimrc / init.vim
" ==================================================
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'dkprice/vim-easygrep'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-dispatch'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'fatih/vim-go'
Plug 'nsf/gocode'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'guns/xterm-color-table.vim'
Plug 'vimoutliner/vimoutliner'
" Plug 'themue/vim-gode'
call plug#end()
" --------------------------------------------------
" SETTINGS
" --------------------------------------------------
filetype off
filetype plugin indent off
set autoread
set autoindent
set incsearch
set noignorecase
set smartcase
set hlsearch
set number
set cursorline
set showcmd
set splitright
set splitbelow
set noswapfile
set autowrite
set showcmd
set splitright
set splitbelow
set noswapfile
set autowrite
set backspace=indent,eol,start
set omnifunc=syntaxcomplete#Complete
set completeopt-=preview
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=0
set shell=bash
set mouse=a
set ttymouse=xterm2
set ttyfast
set ttyscroll=3
set laststatus=2
set encoding=utf-8
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set noexpandtab

set t_Co=256
colorscheme muedark
syntax on

let mapleader = "-"
let maplocalleader = ","

let g:SuperTabDefaultCompletionType = "<C-x><C-o>"
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "sol"
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_info_mode = 'gocode'
let g:go_updatetime = 500

if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8
    setglobal fileencoding=utf-8
endif
" --------------------------------------------------
" FUNCTIONS AND COMMANDS
" --------------------------------------------------
function! g:KbdGerman()
    iunmap ü
    iunmap ö
    iunmap ä
    iunmap Ö
    iunmap Ä
    iunmap ß
endfunction

function! g:KbdProgramming()
    imap ü <C-]>
    imap ö [
    imap ä ]
    imap Ö {
    imap Ä }
    imap ß /
endfunction

command! KbdGerman      :call KbdGerman()
command! KbdProgramming :call KbdProgramming()
command! Todo noautocmd vimgrep /TODO\|FIXME/j ** | cw
" --------------------------------------------------
" KEY MAPPINGS
" --------------------------------------------------
"
" Yank and paste
"
vnoremap <leader>y  "+y
nnoremap <leader>Y  "+yg_
nnoremap <leader>y  "+y
nnoremap <leader>yy "+yy
nnoremap <leader>p  "+p
nnoremap <leader>P  "+P
vnoremap <leader>p  "+p
vnoremap <leader>P  "+P

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"
"
" Move visual block
"
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
"
" Searching
"
nmap <leader>s :%s//gc<LEFT><LEFT><LEFT>
nmap <expr> <leader>sr  ':%s/' . @/ . '//gc<LEFT><LEFT><LEFT>'
nmap <leader>g :vimgrep // **/*<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
nnoremap n nzzzv
nnoremap N Nzzzv
"
" Console
"
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_
map <S-H> gT
map <S-L> gt
"
" Buffers
"
nmap <leader>hh :bprevious<cr>
nmap <leader>ll :bnext<cr>
nmap <leader>xx :bdelete<cr>
"
" CtrlP
"
nnoremap <leader>. :CtrlPBuffer<cr>
nnoremap <leader>: :CtrlPTag<cr>
nnoremap <leader># :CtrlPBufTag<cr>
nnoremap <leader>' :CtrlPBufTagAll<cr>
nnoremap <leader>, :CtrlPChange<cr>
nnoremap <leader>; :CtrlPChangeAll<cr>
"
" Edit and source .vimrc
"
nmap <leader>ev :tabedit $MYVIMRC<cr>
nmap <leader>sv :source $MYVIMRC<cr>
"
" Misc
"
inoremap jj              <esc>
inoremap <leader>ww      <esc>:w<cr>
nnoremap <leader>ww      :w<cr>
nmap     <leader>nn      :cnext<cr>
nmap     <leader>pp      :cprev<cr>
nmap     <leader>cc      :cclose<cr>
nmap     <leader>tt      :TagbarToggle<cr>
nmap     <leader>qq      :qa<cr>
nnoremap <leader><space> :nohlsearch<cr>
nnoremap <leader>N       :setlocal number!<cr>

vnoremap <       <gv
vnoremap >       >gv
nmap     <F11>   :cprev<cr>
nmap     <S-F11> :cpfile<cr>
nmap     <C-F11> :colder<cr>
nmap     <F12>   :cnext<cr>
nmap     <S-F12> :cnfile<cr>
nmap     <C-F12> :cnewer<cr>
" --------------------------------------------------
" ACTIONS
" --------------------------------------------------
if has("autocmd")
	" Write and read buffer.
	autocmd BufWritePre * :%s/\s\+$//e
	autocmd BufReadPost * if line("'\"") | exe "'\"" | endif
	" Go together with vim-go.
	autocmd FileType go nmap <localleader>b <Plug>(go-build)
	autocmd FileType go nmap <localleader>B <Plug>(go-test-compile)
	autocmd FileType go nmap <localleader>c <Plug>(go-coverage)
	autocmd FileType go nmap <localleader>d <Plug>(go-deps)
	autocmd FileType go nmap <localleader>D <Plug>(go-def)
	autocmd FileType go nmap <localleader>f <Plug>(go-imports)
	autocmd FileType go nmap <localleader>F <Plug>(go-fmt)
	autocmd FileType go nmap <localleader>i <Plug>(go-install)
	autocmd FileType go nmap <localleader>l <Plug>(go-lint)
	autocmd FileType go nmap <localleader>r <Plug>(go-run)
	autocmd FileType go nmap <localleader>t <Plug>(go-test-func)
	autocmd FileType go nmap <localleader>T <Plug>(go-test)
	autocmd FileType go nmap <localleader>v <Plug>(go-vet)
	autocmd FileType go nmap <localleader>V <Plug>(go-doc-vertical)
endif
" Keep undo history across sessions by storing it in a file.
if has('persistent_undo')
	let vimdir = '$HOME/.vim'
	let vimundodir = expand(vimdir . '/undodir')
	call system('mkdir ' . vimdir)
	call system('mkdir ' . vimundodir)
	let &undodir = vimundodir
	set undofile
endif

call KbdProgramming()
" ==================================================
" EOF
" ==================================================
