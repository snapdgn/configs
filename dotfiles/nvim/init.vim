" Plugins will be downloaded under the specified directory.
"
"+++++++++++++++++PLUGINS START+++++++++++++++++++++
"
call plug#begin('~/.config/nvim/vim-plug/')
" " Declare the list of plugins.
 "Plug 'tpope/vim-sensible'
 Plug 'scrooloose/syntastic'
 Plug 'scrooloose/nerdtree'
 Plug 'scrooloose/nerdcommenter'
 Plug 'itchyny/lightline.vim'
" Plug 'neoclide/coc.nvim'
 Plug 'dense-analysis/ale'
 Plug 'valloric/youcompleteme'
 Plug 'morhetz/gruvbox'
 Plug 'machakann/vim-highlightedyank'
 Plug 'junegunn/fzf'
 Plug 'jremmen/vim-ripgrep'
 "Plug 'raimondi/delimitmate'
 "markdown preview
 Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
 Plug 'cohama/lexima.vim'
 Plug 'flazz/vim-colorschemes'
 Plug 'airblade/vim-gitgutter'
 Plug 'airblade/vim-rooter'
 Plug 'rust-lang/rls'
 Plug 'godlygeek/tabular'
 Plug 'ncm2/ncm2'
 Plug 'rust-lang/rust.vim'
 Plug 'plasticboy/vim-markdown'
 Plug 'ryanoasis/vim-devicons'
" Plug 'junegunn/seoul256.vim'
"
" " List ends here. Plugins become visible to Vim after this call.
 call plug#end()

"++++++++++++PLUGINS END+++++++++++++++++++++++++++++++++
"
"


set termguicolors     " enable true colors support
"let ayucolor="mirage"
set bg=dark
"let g:gruvbox_transparent_bg = 0
"let g:gruvbox_italic=1
"let g:gruvbox_contrast_dark = 'medium'
colorscheme PaperColor

set laststatus=2
"set noshowmode
filetype plugin on
set autoindent
set autoread
set backspace=indent,eol,start
set clipboard=unnamedplus
set complete-=i
set completeopt+=noselect
set confirm
"set cursorline
set expandtab
set hidden
set hlsearch
set incsearch
set mouse+=a
set nobackup
set nu
set omnifunc=ale#completion#OmniFunc
set ruler
set shiftwidth=4
set smartindent
set smarttab
set so=10
set softtabstop=4
set tabstop=4
set textwidth=80
set title
set updatetime=100
set wildmenu
set wrap
set undodir=$HOME/.vim/undo
set undofile

"Wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

"proper search
set incsearch
set ignorecase
set smartcase
set gdefault

"Delimiters
inoremap {} <CR>{<CR>}<Up><CR>

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'


"set encoding=UTF-8
" set virtualedit=all
""==========NERD TREE==============="
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"let NERDTreeQuitOnOpen = 1

"Start NERDTree when Vim is started without file arguments.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif



"autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" " buffer that's left is the NERDTree buffer
" function! s:CloseIfOnlyNerdTreeLeft()
   "if exists("t:NERDTreeBufName")
       "if bufwinnr(t:NERDTreeBufName) != -1
             "if winnr("$") == 1
                     "q
             "endif
       "endif
    "endif
 "endfunction

 " This does the same thing i.e. quit nerd if its the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Jump to last edit position on opening file
if has("autocmd")
  " https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
  au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif




"===========LIGHTLINE CONFIGS================"

let g:lightline = {
      \ 'colorscheme': 'molokai',
      \ }



"=============MAPPINGS===========================


"inoremap <Leader>, <ESC>:w<CR>
let g:C_Ctrl_j = 'off'
inoremap <C-j> <ESC>:w<CR>
inoremap <C-k> <ESC>:w<CR>

"inoremap kk <ESC>:w<CR>
let mapleader = ","
"map <C-H> <C-W><C-H>
"map <C-J> <C-W><C-J>
"map <C-K> <C-W><C-K>
"map <C-L> <C-W><C-L>
"map <C-m> :cprevious<CR>
"map <C-n> :cnext<CR>
"map <F4> :noh<CR>
"map <F7> gg=G<C-o><C-o>
map <Leader>, :w<CR>
"map <Leader>F <ESC>:FZF<CR>
"map <Leader>G <ESC>:Rg<CR>
map <Leader>[ :bprevious<CR>
map <Leader>] :bnext<CR>
map <Leader>k :NERDTreeToggle <CR>
map <leader>cc :NERDCommenterComment
" <leader>s for Rg search
map <leader>s :Rg<CR>
map <leader>m :MarkdownPreview<CR>

"map <Leader>l :buffers list<CR>
"map <leader>a :cclose <bar> lclose <bar> pclose<CR>
"map <leader>s <C-w>s<CR><C-w><C-J>:term<CR>i
"map <leader>v <C-w>v<CR><C-w><C-L>:term<CR>i
"map <leader>~ :set spell spelllang=en_gb<CR>
"map <silent> <C-j> <Plug>(ale_next_wrap)
"map <silent> <C-k> <Plug>(ale_previous_wrap)
"nnoremap <C-n> :norm
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>

" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" Move by line
"nnoremap j gj
"nnoremap k gk

" Quickly move current line above or below
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

"Quickly add empty lines
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
"Now 5[<space> inserts 5 blank lines above the current line.

" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>




