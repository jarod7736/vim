" include pathogen
call pathogen#infect()
call pathogen#helptags()

set nu
set hidden
let mapleader = ","
nnoremap ' `
nnoremap ` '

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>tw :set wrap<CR>

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

 nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

 nnoremap <leader>w <C-w>s<C-w>l

 nnoremap <C-h> <C-w>h
 nnoremap <C-j> <C-w>j
 nnoremap <C-k> <C-w>k
 nnoremap <C-l> <C-w>l

map <C-j> :bprev<CR>
map <C-k> :bnext<CR>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
 map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
 map <leader>cd :cd %:p:h<cr>:pwd<cr>

 " Specify the behavior when switching between buffers 
 try
   set switchbuf=useopen,usetab,newtab
   set stal=2
 catch
 endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Remap VIM 0 to first non-blank character
map 0 ^

" Remove the Windows ^M - when the encodings gets messed up
 noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
 map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
 map <leader>pp :setlocal paste!<cr>

set history=1000
runtime macros/matchit.vim
set wildmenu
set wildmode=list:longest

set ignorecase
set smartcase
set title
set scrolloff=3
set ruler
set ts=2

set backspace=indent,eol,start
syntax on
filetype plugin indent on
set nocompatible

set hlsearch
set incsearch
set showmatch

set vb
set showmode
set showcmd
set ch=2
set cursorline

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

  " Start the status line
  set statusline=%f\ %m\ %r
  set statusline+=Line:%l/%L[%p%%]
  set statusline+=Col:%v
  set statusline+=Buf:#%n
  set statusline+=[%b][0x%B]
endif


" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
