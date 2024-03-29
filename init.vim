if &compatible
  finish
else
  let g:loaded_sensible = 1
endif

"""------ Dein Start --------------------------------
""filetype off
""" append to runtime path
""set rtp+=/usr/share/vim/vimfiles
""" initialize dein, plugins are installed to this directory
"call dein#begin(expand('~/.cache/dein'))
"	call dein#add('Shougo/dein.vim')
"	call dein#add('Shougo/deoplete.nvim')
"		if !exists('g:deoplete#omni#input_patterns')
"			let g:deoplete#omni#input_patterns = {}
"		endif
"    call dein#add('copy/deoplete-ocaml')
"
"	call dein#add('let-def/ocp-indent-vim')
"
"    call dein#add('sbdchd/neoformat')
"
"    call dein#add('tpope/vim-sensible')
"
"    call dein#add('itchyny/lightline.vim')
"    call dein#add('itchyny/vim-gitbranch')
"    
"    call dein#add('lifepillar/vim-solarized8')
"    
"    call dein#add('scrooloose/nerdtree')
"    
"    call dein#add('editorconfig/editorconfig-vim')
"    
"    call dein#add('w0rp/ale')
"" exit dein
"call dein#end()
"" auto-install missing packages on startup
"if dein#check_install()
"  call dein#install()
"endif

if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  "call dein#add('copy/deoplete-ocaml')
  "call dein#add('let-def/ocp-indent-vim')

  "call dein#add('w0rp/ale')

  call dein#add('scrooloose/nerdtree')

  call dein#add('itchyny/vim-gitbranch')
  call dein#add('itchyny/lightline.vim')

  call dein#add('tpope/vim-sensible')

  call dein#end()
  call dein#save_state()
endif
"----- Dein End -----------------------------------
if dein#check_install()
  call dein#install()
endif
let g:deoplete#enable_at_startup = 1


if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal

set ttimeout
set ttimeoutlen=100

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

set laststatus=2
set ruler
set showcmd
set wildmenu

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags^=./tags;
endif

if &shell =~# 'fish$'
  set shell=/bin/bash
endif

set autoread
set fileformats+=mac

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

"" Load matchit.vim, but only if the user hasn't installed a newer version.
"if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
"  runtime! macros/matchit.vim
"endif


"----- Custom Settings ----------------------------
"-------- Lightline settings ------------
let g:lightline = {
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'filename' ],
  \ 			 [ 'gitbranch' ]
  \     ],
  \ 	'right':[	[ 'lineinfo'],
  \ 				[ 'percent'],
  \					[ 'filetype' ]
  \		]
  \   },
  \   'component_function': {
  \     'gitbranch': 'gitbranch#name',
  \   }
  \ }

set noshowmode

"-------- Rebindings --------------------
" Toggle Nerdtree pane
map <C-o> : NERDTreeToggle<CR>

tnoremap <Esc> <C-\><C-n>

nmap <A-h> <C-W>h
nmap <A-j> <C-W>j
nmap <A-k> <C-W>k
nmap <A-l> <C-W>l
inoremap <C-U> <C-G>u<C-U>
