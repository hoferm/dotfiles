let mapleader = "\\"

" vim-plug {{{1
call plug#begin('~/.vim/plugged')

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'vim-utils/vim-cscope'
Plug 'junegunn/fzf.vim'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'farmergreg/vim-lastplace'

call plug#end()

" Plugin Settings {{{1
" FZF {{{2
let g:fzf_colors =
          \ { 'fg':  ['fg', 'Normal'],
            \ 'bg':  ['bg', 'Normal'],
            \ 'hl':  ['fg', 'Type'],
            \ 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+': ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+': ['fg', 'String'] }
let g:fzf_command_prefix = 'Fzf'

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
" vimtex {{{2
let g:vimtex_view_method = 'zathura'
" vim-go {{{2
let g:go_highlight_functions = 0
let g:go_highlight_methods = 0
let g:go_fmt_command = "goimports"
let g:go_play_browser_command = "firefox"
let g:go_list_type = "locationlist"
let g:go_metalinter_autosave = 0
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']

augroup vim-Go
	au!
	au FileType go nmap <Leader>i <Plug>(go-info)
	au BufWritePost *.go GoBuild
augroup END

" vim-lastplace {{{2
let g:lastplace_open_folds = 0
" vim-rust {{{2
let g:rustfmt_autosave = 1

" vim-lsp {{{2
if executable('rls')
	au User lsp_setup call lsp#register_server({
	\ 'name': 'rls',
	\ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
	\ 'whitelist': ['rust'],
	\ })
endif
" Folding {{{1
set foldmethod=marker
set foldlevelstart=0

function! NeatFoldText() "
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '/' . printf("%10s", lines_count . ' lines') . ' /'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()

" Misc {{{1
" cscope {{{2
if has("cscope")
    set cst
    set csto=0
endif
" }}}

" LaTeX
let g:tex_flavor='latex'

" True color
set termguicolors
let &t_8f = "[38;2;%lu;%lu;%lum"
let &t_8b = "[48;2;%lu;%lu;%lum"
let &t_ZM = "[3m"
let &t_ZH = "[23m"

syntax enable
colorscheme micro-comment
aug RustColor
    au!
    au FileType rust colorscheme rusty
filetype plugin indent on

" GUI
set go-=T
set go-=m
set go-=r

set showmode

" Persistent undo
set undofile
set undodir=~/.vim/undodir

set exrc
set secure

set background=dark
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set ttyfast
set nobackup

set autoindent
set copyindent

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set t_Co=256
set showmatch
set comments=s1:/*,mb:\ *,e1x:\ */

set number
set showcmd

set incsearch
set ignorecase
set smartcase

set hlsearch

set hidden

set backspace=indent,eol,start

set wildignore=*.swp,*.bak,*.pyc,*.class

" listchars
set list
set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:>-

aug RustList
	au!
	au FileType rust set nolist

" devicon fzf {{{2

" Files + devicons
function! Fzf_files_with_dev_icons(command)
	let l:fzf_files_options = '--preview "bat --color always --style numbers {2..} | head -'.&lines.'"'
	function! s:edit_devicon_prepended_file(item)
		let l:file_path = a:item[4:-1]
		execute 'silent e' l:file_path
	endfunction
	call fzf#run({
		\ 'source': a:command.' | devicon-lookup',
		\ 'sink':   function('s:edit_devicon_prepended_file'),
		\ 'options': '-m ' . l:fzf_files_options,
		\ 'down':    '40%' })
endfunction
function! Fzf_git_diff_files_with_dev_icons()
	let l:fzf_files_options = '--ansi --preview "sh -c \"(git diff --color=always -- {3..} | sed 1,4d; bat --color always --style numbers {3..}) | head -'.&lines.'\""'
	function! s:edit_devicon_prepended_file_diff(item)
		echom a:item
		let l:file_path = a:item[7:-1]
		echom l:file_path
		let l:first_diff_line_number = system("git diff -U0 ".l:file_path." | rg '^@@.*\+' -o | rg '[0-9]+' -o | head -1")
		execute 'silent e' l:file_path
		execute l:first_diff_line_number
	endfunction
	call fzf#run({
		\ 'source': 'git -c color.status=always status --short --untracked-files=all | devicon-lookup',
		\ 'sink':   function('s:edit_devicon_prepended_file_diff'),
		\ 'options': '-m ' . l:fzf_files_options,
		\ 'down':    '40%' })
endfunction
 " Open fzf Files " Open fzf Files
map <C-f> :call Fzf_files_with_dev_icons("fd -t f .")<CR> " :Files
map <C-g> :call Fzf_files_with_dev_icons("git ls-files \| uniq")<CR> " :GFiles

" Status bar {{{2
" status bar info and appearance
" function! StatusDir()
"     if &buftype != "nofile"
"         let d = expand("%:p:~:h")
"         if d != fnamemodify(getcwd(), ":~")
"         return expand("%:p:.:h").'/'
"         else
"         return ''
"         endif
"     else
"         return ''
"     endif
" endfunction

" function! OtherBuffers()
"     let buffers_txt = ""
"     redir => buffers_txt
"     silent ls
"     redir END
"     let lines = []
"     for line in split(buffers_txt, "\n")
"         let bufnr = split(line)[0]
"         if bufnr != bufnr("%")
"             call add(lines, split(line)[0])
"         endif
"     endfor
"     return lines
" endfunction

" function! StatusOtherBuffers()
"     return join(map(OtherBuffers(), '"·".v:val'), ' ')
" endfunction

" function! PWD()
"     return fnamemodify(getcwd(), ":~")
" endfunction

set laststatus=0
" set statusline=%#SLDelim#@:%#SLSpecial#%{PWD()}
" set statusline+=%#SLDelim#:%#SLNumber#%n%#SLDelim#: "buffer number
" set statusline+=%#SLDirectory#%{expand('%:h')!=''?StatusDir():''} "file path, if buffer is a file
" set statusline+=%#SLIdentifier#%{expand('%:h')!=''?expand('%:t'):'[unnamed]'}%#Boolean#%m%r "buffer name and modifiers
" set statusline+=%#SLDelim#%{fugitive#head()!=''?':':''}%#SLVCS#%{fugitive#head()}
" " au VimEnter * au! fugitive_statusline
" set statusline+=\ %#SLCharacter#%{StatusOtherBuffers()} "list of other buffers
" set statusline+=\ %=\%#SLConstant#%{&fenc}%#SLDelim#:%#SLType#%{&ft}%#SlDelim#:%#SLFunction#%{&fo}%#SLDelim#:%#SLSpellBad#%{&spell?&spl:''}
" set statusline+=%#SLNumber#\ %l:%L,%v
" " set statusline+=%#Warningmsg#
" " set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" }}}
" set statusline+=%{expand('%:h')!=''?expand('%:t'):'[unnamed]'}%m%r
set rulerformat=%28(%20(%t%m%r\ %l,%c%V%)%=%P%)
set wildmenu
set wildmode=full
" set statusline=\ \%f%m%r%h%w\ ::\ %y\ [%{&ff}]\%=\ [%p%%:\ %l/%L]\
set cmdheight=1

let g:is_bash=1                         " bash syntax the default for hlighting

" Close quickfix window if it is the only window.
aug QFClose
	au!
	au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

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

" Move between panes
map <up> <C-W><up>
map <down> <C-W><down>
map <left> <C-W><left>
map <right> <C-W><right>

inoremap <Esc> <Esc>
nnoremap <Esc> <Esc>
vnoremap <Esc> <Esc>
nnoremap S "_diwP

nnoremap zo o<CR>

nnoremap Y y$

nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P

" FZF bindings
nnoremap <Leader><SPACE> :FzfTags<CR>
nnoremap <Leader>e :FZF<CR>
nnoremap <Leader>o :FzfBTags<CR>
nnoremap <Leader>b :FzfBuffers<CR>

" incsearch for range commands
cnoremap $t <CR>:t''<CR>:noh<CR>
cnoremap $m <CR>:m''<CR>:noh<CR>
cnoremap $d <CR>:d<CR>``:noh<CR>

nnoremap <silent> <Leader>t :<C-U>call Z_CopyLine()<CR>
nnoremap <silent> <Leader>T :<C-U>call Z_CopyLineTo()<CR>==
nnoremap <silent> <Leader>m :<C-U>call Z_MoveLine()<CR>
nnoremap <silent> <Leader>M :<C-U>call Z_MoveLineTo()<CR>==
nnoremap <silent> <Leader>d :<C-U>call Z_DeleteLine()<CR>``

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
nnoremap <Leader>q :bd<CR>

nnoremap <silent> <Tab> :silent noh<CR>

" clipboard
vmap <Leader>cx :w !xsel -i -b<CR><CR>
nmap <leader>px :r !xsel -b<CR>

" fugitive bindings
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR>
