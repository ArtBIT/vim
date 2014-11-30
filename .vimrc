" ----------------------------------------------------------------
"  GLOBAL PATHS AND VARIABLES
" ----------------------------------------------------------------

let b:author='Djordje Ungar'
let b:email='djordje.ungar@gmail.com'
let mapleader = ","
let maplocalleader=','          " all my macros start with 

" ----------------------------------------------------------------
"  BASIC SETTINGS
" ----------------------------------------------------------------
" Colors
colorscheme sonoma         " awesome colorscheme
set background=dark
" Syntax 
syntax enable
" Tabs
set smarttab                    "let's be smart about our tabs
set expandtab                   "expand tabs to spaces, when not an indent
set shiftwidth=4                "make tabs 4 spaces
set softtabstop=4               "number of spaces in tab when editing
set tabpagemax=25
set tabstop=4                   "keep default for softtab compat.
" UI
set cursorline
set ruler                       " show the line number on the bar
set number                      " line numbers
set nolazyredraw                " always redraw
" Search
set hlsearch                    " highlight searched text
set incsearch                   " show matches as I type
set showmatch                   " Show matching brackets.
" Leader
set autoindent smartindent      " auto/smart indent
set autoread                    " watch for file changes
set backspace=indent,eol,start
set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set clipboard=unnamed
set cmdheight=2                 " command line two lines high
set complete=.,w,b,u,U,t,i,d    " do lots of scanning on tab completion
set ff=unix
set fileformats=unix
set hidden
set history=200
set laststatus=2
set linebreak
set listchars=tab:>-,trail:·,eol:$
set modeline
set modelines=2
set more                        " use more prompt
set autowrite                   " set autowrite for omni completeion
set nocompatible                " vim, not vi
set scrolloff=5                 " keep at least 5 lines above/below
set shell=bash
set showcmd
set showmode
set sidescrolloff=5             " keep at least 5 lines left/right
set timeout timeoutlen=1000 ttimeoutlen=100 
set title                       " make the xterm window title bar show you the current filename
set ttyfast                     " we have a fast terminal
set undolevels=1000             " 1000 undos
set updatecount=100             " switch every 100 chars
set vb t_vb=
set visualbell
set noerrorbells                " No error bells please
set wildmenu                    " menu has tab completion
set wildmode=longest:full
set wrap                        " wrap long lines
" screen term
if match($TERM, "screen")!=-1
    set term=xterm
    "set term=xterm=256color
endif
" try to use 256 colors
set t_Co=256 

" :E does not know whether you want to run :Explore or :Errors
command! E Explore


" ----------------------------------------------------------------
"  STATUS LINE SETTINGS
" ----------------------------------------------------------------
" Always show a status line
set laststatus=2
" make the command line 1 line high
set cmdheight=1
" Left side of the statusline
set statusline=[%c,%l]\ %t%h%m%r
" Right side of the statusline
" [ASCII HEX] LINE, COL, PERCENTAGE
set statusline+=%=[%b\ 0x%02B]\ %P

" ----------------------------------------------------------------
"  KEY BINDINGS                                                 
" ----------------------------------------------------------------

" Move between the open tabs by using TAB/SHIFT+TAB
nnoremap <silent> <S-TAB> gT
nnoremap <silent> <TAB> gt
 
" save session
nnoremap <silent> <F2> :wa<Bar>exe "mksession! $VIMS/last.vim"<CR>

" SHOW HIDDEN CHARS
nmap <silent> <leader>h :set nolist!<CR>

" HIGHLIGHT SEARCH 
noremap <silent> <leader>n :set hlsearch! hlsearch?<CR>

" ----------------------------------------------------------------
"  PLUGIN SPECIFIC SETTINGS                                     
" ----------------------------------------------------------------

" CtrlP
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
silent! nnoremap <unique> <silent> <Leader>t :CtrlPMRU<CR>
silent! nnoremap <unique> <silent> <Leader>b :CtrlPBuffer<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-e>"
let &runtimepath.=',~/.vim/snippets'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mine"]

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Gundo
nnoremap <leader>u :GundoToggle<CR>

" PHP Documenter
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <silent> <leader>p :call pdv#DocumentWithSnip()<CR>
imap <C-o> :set paste<CR>:exe PhpDoc()<CR>:set nopaste<CR>i
imap <C-f> :set paste<CR>:exe PhpDocFunc()<CR>:set nopaste<CR>i

" Syntastic PHP Code Sniffer
let g:syntastic_php_phpcs_args='--standard=$DA_TOOLS_ROOT/php_codesniffer/deviantART'

" Vim-unimpaired
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Tabular
nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>a: :Tabularize /:\zs<CR>
vmap <leader>a: :Tabularize /:\zs<CR>

" ----------------------------------------------------------------
"  AUTOCMD SETTINGS                                            
" ----------------------------------------------------------------
augroup skeletons
  au!
  au BufNewFile *.* silent! exe "0r ~/.vim/skeletons/". expand("<afile>:e") .".skeleton"
augroup END

augroup filetypedetect
    au BufNewFile,BufRead *.as      setfiletype actionscript
    au BufNewFile,BufRead *.java    setfiletype java
    au BufNewFile,BufRead *.js      setfiletype javascript
    au BufNewFile,BufRead *.hx      setfiletype haxe
augroup END

" ----------------------------------------------------------------
"  LOAD GLOBAL FUNCTIONS
" ----------------------------------------------------------------
exec "silent! runtime functions/global.vim"
exec "silent! runtime functions/noeol.vim"

" ----------------------------------------------------------------
"  VUNDLE SETTINGS                                              
" ----------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'sjl/gundo.vim'
Plugin 'vim-scripts/SQLComplete.vim'
Plugin 'FuDesign2008/jslhint.vim'
Plugin 'scrooloose/syntastic'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'godlygeek/tabular'
Plugin 'bling/vim-airline'
Plugin 'tobyS/vmustache'
Plugin 'ArtBIT/vim-vmsri'
Plugin 'ArtBIT/vim-tmpl'
Bundle 'tobyS/pdv'
call vundle#end()            " required
filetype plugin indent on    " required

