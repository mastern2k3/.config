set encoding=utf-8

" }}}
" Tabs and Indents {{{
" ----------------
set textwidth=80    " Text width maximum chars before wrapping
set expandtab     " Don't expand tabs to spaces.
set tabstop=2       " The number of spaces a tab is
set softtabstop=2   " While performing editing operations
set smarttab        " Tab insert blanks according to 'shiftwidth'
set autoindent      " Use same indenting on new lines
set smartindent     " Smart autoindenting on new lines
set shiftround      " Round indent to multiple of 'shiftwidth'
set shiftwidth=2    " Number of spaces to use in auto(indent)

" }}}
" Behavior {{{
" --------
" set linebreak                   " Break long lines at 'breakat'
" set breakat=\ \	;:,!?           " Long lines break chars
" set nostartofline               " Cursor in same column for few commands
" set whichwrap+=h,l,<,>,[,],~    " Move to following line on certain keys
" set splitbelow splitright       " Splits open bottom right
" set switchbuf=usetab,split      " Switch buffer behavior
" set backspace=indent,eol,start  " Intuitive backspacing in insert mode
" set diffopt=filler,iwhite       " Diff mode: show fillers, ignore white
" set formatprg=par\ -w78         " Using http://www.nicemice.net/par/
" set tags=./tags,tags            " Tags are overridden by bundle/tagabana
" set showfulltag                 " Show tag and tidy search in completion
" set completeopt=menuone         " Show menu even for one item
" set complete=.                  " No wins, buffs, tags, include scanning
" if exists('+breakindent')
" 	set breakindent
" 	set wrap
" else
" 	set nowrap
" endif

" }}}
" Editor UI Appearance {{{
" --------------------
set noshowmode          " Don't show mode in cmd window
set shortmess=aoOTI     " Shorten messages and don't show intro
set scrolloff=2         " Keep at least 2 lines above/below
set sidescrolloff=2     " Keep at least 2 lines left/right
set pumheight=20        " Pop-up menu's line height
set number              " Show line numbers
set noruler

set showtabline=2       " Always show the tabs line
set tabpagemax=30       " Maximum number of tab pages
set winwidth=30         " Minimum width for current window
set winheight=1         " Minimum height for current window
set previewheight=8     " Completion preview height
set helpheight=12       " Minimum help window height

set display+=lastline,uhex
set notitle             " No need for a title
set noshowcmd           " Don't show command in status line
set cmdheight=1         " Height of the command line
set cmdwinheight=10     " Command-line lines
set noequalalways       " Don't resize windows on split or close
set laststatus=2        " Always show a status line

" Changing characters to fill special ui elements
set showbreak=↪
set fillchars=vert:│,fold:─
set list listchars=tab:\⋮\ ,extends:⟫,precedes:⟪,nbsp:.,trail:·

" Do not display completion messages
" Patch: https://groups.google.com/forum/#!topic/vim_dev/WeBBjkXE8H8
if has('patch-7.4.314')
	set shortmess+=c
endif

" Highlight just a single character on the 81st virtual column
call matchadd('ColorColumn', '\%81v', 100)

" For snippet_complete marker
if has('conceal') && v:version >= 703
	set conceallevel=2 concealcursor=niv
endif

" Use ag instead of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" }}}
" Folds {{{
" -----
if has('folding')
	set foldenable
	set foldmethod=syntax
	set foldlevelstart=99
	set foldtext=FoldText()
endif

" Bindings
map <C-n> :NERDTreeToggle<CR>

" Plugins
filetype plugin indent on

" ignore case on defaut `/` searches
set ignorecase
set smartcase

" english lol
set spell spelllang=en_us

colorscheme nord
