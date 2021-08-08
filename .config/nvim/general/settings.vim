set termguicolors
set enc=utf8
set fenc=utf8
set termencoding=utf8

if has("cscope")
    set cst
    set csto=0
endif

set updatetime=300

set inccommand=nosplit

" Python 3
let g:python3_host_prog = "/bin/python"

" Change shell to bash for compatibility
if executable('fish')
    " use fish for embedded terminals
    set shell=fish
    " use bash for else
    let $SHELL = 'bash'
endif

set noshowmode

" Persistent undo
set undofile
set undodir=~/.config/nvim/undodir

set exrc
set secure

set nobackup

set autoindent
set copyindent

set splitright
set splitbelow

set scrolloff=2
set showmatch
set comments=s1:/*,mb:\ *,e1x:\ */

set number
" aug numbertoggle
"     au!
"     au BufEnter,CmdlineLeave,CmdwinLeave,FocusGained,InsertLeave * set relativenumber | redraw
"     au BufLeave,CmdlineEnter,CmdwinEnter,FocusLost,InsertEnter * set norelativenumber | redraw
" aug END

set signcolumn=yes

set showcmd
set laststatus=2

set incsearch
set ignorecase
set smartcase

set hlsearch

set hidden

" set backspace=indent,eol,start

set wildignore=*.swp,*.bak,*.pyc,*.class

" listchars
set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:>-

set wildmenu
set wildmode=full

set mouse=a

set title

" Close quickfix window if it is the only window.
aug QFClose
    au!
    au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END
