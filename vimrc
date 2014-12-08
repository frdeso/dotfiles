" Basics
set mouse=a
set clipboard=unnamed
set laststatus=2   " Always show the statusline
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
set sw=4
set ts=4 " Tabs, shown as 4 spaces

" Search
set ignorecase
set incsearch " Search as you type
set gdefault  " Always use the g flag for search

" Matching
set matchpairs+=<:>

" Mapping
nmap <Space> :
map - <Leader>
map <C-7> :TComment
nnoremap <Tab> %
vnoremap <Tab> %

" Changing the case
nmap <Leader>u gUl
nmap <leader>l gul

" Navigating in wrapped lines
if !exists('vimpager')
	nnoremap j gj
	nnoremap k gk
endif

map <Down> gj
map <Up> gk

" tmux integration
let g:tmux_is_last_pane = 0
au WinEnter * let g:tmux_is_last_pane = 0
 
" Like `wincmd` but also change tmux panes instead of vim windows when needed.
function TmuxWinCmd(direction)
  let nr = winnr()
  let tmux_last_pane = (a:direction == 'p' && g:tmux_is_last_pane)
  if !tmux_last_pane
    " try to switch windows within vim
    exec 'wincmd ' . a:direction
  endif
  " Forward the switch panes command to tmux if:
  " a) we're toggling between the last tmux pane;
  " b) we tried switching windows in vim but it didn't have effect.
  if tmux_last_pane || nr == winnr()
    let cmd = 'tmux select-pane -' . tr(a:direction, 'phjkl', 'lLDUR')
    exec 'silent !'.cmd
    redraw! " because `exec` fucked up the screen. why is this needed?? arrghh
    let g:tmux_is_last_pane = 1
  else
    let g:tmux_is_last_pane = 0
  endif
endfunction
 
" navigate between split windows/tmux panes
nmap <c-j> :call TmuxWinCmd('j')<cr>
nmap <c-k> :call TmuxWinCmd('k')<cr>
nmap <c-h> :call TmuxWinCmd('h')<cr>
nmap <c-l> :call TmuxWinCmd('l')<cr>
nmap <c-\> :call TmuxWinCmd('p')<cr>


" highlight the 80th character on a +80 characters long line
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)

" open a file and move the cursor to the last position
if has("autocmd")
	  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
