let mapleader = " "

" Plugins {{{1
call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'antoinemadec/coc-fzf'

" UI enhancements
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-gitgutter'

Plug 'editorconfig/editorconfig-vim'

Plug 'vim-utils/vim-cscope'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" QOL
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'farmergreg/vim-lastplace'

" Language
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'dag/vim-fish'

call plug#end()

" Plugin Settings {{{1
" Airline {{{2
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
let g:airline_section_z = '%3l/%L:%3v'
let g:airline_left_sep = "\uE0B4"
let g:airline_right_sep = "\uE0B6"
let g:airline#extensions#coc#enabled = 1
let g:airline_section_warning = ''
let g:airline_section_error = ''
" Tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#buffers_label = 'B'
let g:airline#extensions#tabline#tabs_label = 'T'
let g:airline#extensions#tabline#formatter = 'unique_tail'
" FZF {{{2
let g:fzf_colors =
          \ { 'fg':  ['fg', 'Normal'],
            \ 'bg':  ['bg', 'Normal'],
            \ 'hl':  ['fg', 'Type'],
            \ 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+': ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+': ['fg', 'String'] }
let g:fzf_command_prefix = 'Fzf'
let $FZF_DEFAULT_COMMAND = 'fd --hidden --type f --exclude ".git/"'

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "never"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf,rs}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* FzfRg call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
" command! -bang -nargs=* FzfRg call fzf#vim#rg(<q-args>, { 'options': ['--color', 'hl:#569cd6', 'hl+:#dea584'] }, <bang>0)
" vimtex {{{2
let g:vimtex_view_method = 'mupdf'
let g:vimtex_quickfix_autoclose_after_keystrokes = 1
" vim-go {{{2
let g:go_highlight_functions = 0
let g:go_highlight_methods = 0
let g:go_fmt_command = "goimports"
let g:go_play_browser_command = "firefox"
let g:go_list_type = "locationlist"
let g:go_metalinter_autosave = 0
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']

" vim-lastplace {{{2
let g:lastplace_open_folds = 0
" vim-rust {{{2
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

" coc {{{2
set cmdheight=2
set updatetime=300
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" coc-actions
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" Misc {{{1
" cscope {{{2
if has("cscope")
    set cst
    set csto=0
endif
" }}}

" LaTeX
let g:tex_flavor = 'latex'

" True color
set termguicolors

set inccommand=nosplit

" Python 3
let g:python3_host_prog = "/bin/python"

filetype plugin indent on
syntax enable
let g:gruvbox_italic = 1
" let g:gruvbox_bold = 0
let g:gruvbox_invert_selection = 1
colorscheme gruvbox
hi link rustCommentLineDoc rustCommentLine
hi link rustFuncCall GruvboxBlue
hi link rustFuncName GruvboxBlue

set noshowmode

" Persistent undo
set undofile
set undodir=~/.config/nvim/undodir

set exrc
set secure

set background=dark
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set nobackup

set autoindent
set copyindent

set tabstop=8
set shiftwidth=8
set softtabstop=8
set noexpandtab

set scrolloff=2

set showmatch
set comments=s1:/*,mb:\ *,e1x:\ */

set number

aug numbertoggle
    au!
    au BufEnter,CmdlineLeave,CmdwinLeave,FocusGained,InsertLeave * set relativenumber | redraw
    au BufLeave,CmdlineEnter,CmdwinEnter,FocusLost,InsertEnter * set norelativenumber | redraw
aug END

set signcolumn=yes

set showcmd
set laststatus=2

set incsearch
set ignorecase
set smartcase

set hlsearch

set hidden

set backspace=indent,eol,start

set wildignore=*.swp,*.bak,*.pyc,*.class

" listchars
set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:>-

set wildmenu
set wildmode=full

" Folding
set foldmethod=syntax
set nofoldenable
set foldnestmax=2

let g:is_bash=1                         " bash syntax the default for hlighting

" Close quickfix window if it is the only window.
aug QFClose
    au!
    au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

" Set title{{{2
set title
" Remove trailing whitespaces {{{2
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

augroup TrailingWhitespace
    autocmd!
    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
augroup END

command! -nargs=+ MapToggle call MapToggle(<f-args>)
" Keys & functions {{{2

augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END

" Bindings {{{1
nnoremap j gj
nnoremap k gk
nnoremap n nzz
nnoremap N Nzz
nnoremap <C-U> <C-U>zz
nnoremap <C-D> <C-D>zz

" Auto close bracket
inoremap {<CR> {<CR>}<C-c>O

" Enable 'very magic' by default
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/

" Splits
nnoremap <Leader>wv :vsplit<CR>
nnoremap <Leader>ws :split<CR>
nnoremap <Leader>wc :close<CR>
" Closes all panes but the current one
nnoremap <Leader>wo :only<CR>
" Hide pane
nnoremap <Leader>wh :hide<CR>
" Move between panes
nnoremap <Leader>wk <C-W><up>
nnoremap <Leader>wj <C-W><down>
nnoremap <Leader>wh <C-W><left>
nnoremap <Leader>wl <C-W><right>
nnoremap <Leader>wr <C-W>r
" Resize windows
nnoremap <Leader>w= <C-W>=

inoremap <Esc> <Esc>
nnoremap <Esc> <Esc>
vnoremap <Esc> <Esc>

nnoremap zo o<CR>

" Copy to end of line
nnoremap Y y$

" FZF bindings
" nnoremap <Leader><SPACE> :FzfTags<CR>
nnoremap <Leader>e :FZF<CR>
nnoremap <Leader>o :FzfBTags<CR>
nnoremap <Leader>, :FzfBuffers<CR>
" nnoremap <Leader>gg :FzfRg<CR>

" incsearch for range commands
cnoremap $t <CR>:t''<CR>:noh<CR>
cnoremap $m <CR>:m''<CR>:noh<CR>
cnoremap $d <CR>:d<CR>``:noh<CR>

nnoremap <silent> <Leader>t :<C-U>call Z_CopyLine()<CR>
nnoremap <silent> <Leader>T :<C-U>call Z_CopyLineTo()<CR>==
nnoremap <silent> <Leader>m :<C-U>call Z_MoveLine()<CR>
nnoremap <silent> <Leader>M :<C-U>call Z_MoveLineTo()<CR>==
nnoremap <silent> <Leader>d :<C-U>call Z_DeleteLine()<CR>``

nnoremap <silent> <Leader><Leader>t :<C-U>call SynGroup()<CR>

" functions for manipulating lines with given line number
function! Z_CopyLine()
    let c = v:count
    execute ':' . v:count . 't.'
endfunction

function! Z_CopyLineTo()
    let c = v:count
    execute ':.t' . v:count
endfunction

function! Z_MoveLineTo()
    let c = v:count
    execute ':.m' . v:count
endfunction

function! Z_MoveLine()
    let c = v:count
    execute ':' . v:count . 'm.'
endfunction

function! Z_DeleteLine()
    let c = v:count
    execute ':' . v:count . 'd'
endfunction

" Buffer specific bindings
" Close buffer
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>fs :w<CR>
nnoremap <CR> :q<CR>

nnoremap <silent> <Leader><Tab> :silent noh<CR>

" Folding with tab
nnoremap <Tab> za

" clipboard
" vmap <silent> <Leader>cx :w !xsel -i -b<CR><CR>
" nmap <silent> <leader>px :r !xsel -b<CR>
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P

" git bindings
function! s:changebranch(branch)
    execute 'Git checkout' . a:branch
    call feedkeys("i")
endfunction

" Use fzf for git branch completion
command! -bang Gbranch call fzf#run({
            \ 'source': 'git branch -a --no-color | grep -v "^\* " ',
            \ 'sink': function('s:changebranch')
            \ })
nnoremap <Leader>gc :Gbranch<CR>
nnoremap <Leader>gg :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gp <Plug>(GitGutterPreviewHunk)
nnoremap <Leader>gss <Plug>(GitGutterStageHunk)
nnoremap <Leader>gu <Plug>(GitGutterUndoHunk)

" coc.vim | code
nnoremap <silent> K :<C-U>call CocActionAsync('doHover')<CR>
nmap <silent> <Leader>cd <Plug>(coc-definition)
nmap <silent> <Leader>cy <Plug>(coc-type-definition)
nmap <silent> <Leader>ci <Plug>(coc-implementation)
nmap <silent> <Leader>cr <Plug>(coc-references)
nnoremap <silent> <Leader>cf :RustFmt<CR>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" xmap <silent> <leader>ca :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
" nmap <silent> <leader>ca :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
nmap <Leader>ca <Plug>(coc-codeaction)
" nnoremap <silent> <Leader>co :<C-u>CocList outline<CR>
nnoremap <silent> <Leader>co :CocFzfListOutline<CR>
" function text object
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" spellchecking
map <silent> <F5> :setlocal spell! spelllang=de_at<CR>
map <silent> <F6> :setlocal spell! spelllang=en_us<CR>
