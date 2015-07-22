" Basics
set mouse=a
"set clipboard=unnamed
set laststatus=2   " Always show the statusline

" show filename, file type, position in file and time of day
set statusline=%f%m%r%h%w\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set encoding=utf-8 " Necessary to show Unicode glyphs
set noeb vb t_vb=  " Disable sound
set nojoinspaces   " No double space when joining lines
set whichwrap=b,s,[,],<,>,h,l " Allow cursor to wrap between lines
set showcmd
set shortmess+=I   " Hide Vim startup message
set autoread
set backspace=2

" Highlight search
set hlsearch
" Color scheme
set background=dark

" Layout stuff
syntax enable
set number
set cul " Highlight the current line
set scrolloff=5 " Scroll distance at the top / bottom
set wildmenu
au VimResized * :wincmd = " Resize split when the terminal is resized

" Highlight extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" File types
filetype off
filetype plugin indent on
au BufRead,BufNewFile,BufWrite,BufEnter *.json setf javascript
au BufRead,BufNewFile,BufWrite,BufEnter {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Capfile,Guardfile,config.ru,.caprc,.irbrc,*.rake} setf ruby
au Filetype vim let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'", '`':'`'}

" Backup
set noswapfile
set nobackup

" Indentation
set smartindent
set autoindent
set noet ci pi 
set sts=0
set sw=2
set ts=2 " Tabs, shown as 4 spaces

" Search
set ignorecase
set incsearch " Search as you type
set gdefault  " Always use the g flag for search

" replace stray character with a dot so it's easier to find.
set listchars+=nbsp:.

" Matching
set matchpairs+=<:>

" Mapping
"nmap <Space> :
"map - <Leader>
"map <C-7> :TComment
"nnoremap <Tab> %
"vnoremap <Tab> %

"Set space as the leader
let mapleader = "\<Space>"

" Move between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>


" Changing the case
nmap <Leader>u gUl
nmap <Leader>i gul

" Navigating in wrapped lines
if !exists('vimpager')
	nnoremap j gj
	nnoremap k gk
endif

" highlight the 80th character on a +80 characters long line
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)

" open a file and move the cursor to the last position
if has("autocmd")
	  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline', {'tag' : 'v0.7'}
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'mileszs/ack.vim'
"Plug 'SirVer/ultisnips'
"Plug 'luochen1990/indent-detector.vim'

call plug#end()
let g:airline_powerline_fonts = 1
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>t :NERDTreeToggle<CR>