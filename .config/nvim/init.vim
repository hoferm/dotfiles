let mapleader = "\\"

" Plugins {{{1
call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'itchyny/lightline.vim'

Plug 'editorconfig/editorconfig-vim'

Plug 'w0rp/ale'
Plug 'vim-utils/vim-cscope'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'farmergreg/vim-lastplace'

" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'

Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'

Plug 'SirVer/ultisnips', { 'for': 'tex' }
Plug 'honza/vim-snippets', { 'for': 'tex' }
Plug 'lervag/vimtex', { 'for': 'tex' }

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

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

augroup vim-Go
	au!
	au FileType go nmap <Leader>i <Plug>(go-info)
	au BufWritePost *.go GoBuild
augroup END

" vim-lastplace {{{2
let g:lastplace_open_folds = 0
" vim-rust {{{2
let g:rustfmt_autosave = 0

" coc {{{2
set cmdheight=1
set updatetime=300
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

autocmd CursorHold * silent call CocActionAsync('highlight')
" ale {{{2
let g:ale_set_highlights = 0
let g:ale_lint_on_text_changed = "never"
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 0
let g:ale_lint_on_enter = 0
let g:ale_rust_rls_config = {
    \ 'rust': {
        \ 'all_targets': 1,
        \ 'build_on_save': 1,
        \ 'clippy_preference': 'on'
    \ }
    \ }
let g:ale_rust_rls_toolchain = ""
let g:ale_linters = {'rust': ['rls']}

nnoremap <silent> K :ALEHover<CR>
nnoremap <silent> gd :ALEGoToDefinition<CR>

" Markdown {{{2
let g:mkdp_browser = 'firefox'

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
let g:tex_flavor = 'latex'

" True color
set termguicolors

set inccommand=nosplit

" Python 3
let g:python3_host_prog = "/bin/python"

syntax enable
colorscheme base16-tomorrow-night
" aug RustColor
"     au!
"     au FileType rust colorscheme blue
filetype plugin indent on

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

set ttyfast
set nobackup

set autoindent
set copyindent

set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab

set showmatch
set comments=s1:/*,mb:\ *,e1x:\ */

set number

aug numbertoggle
    au!
    au BufEnter,CmdlineLeave,CmdwinLeave,FocusGained,InsertLeave * set relativenumber | redraw
    au BufLeave,CmdlineEnter,CmdwinEnter,FocusLost,InsertEnter * set norelativenumber | redraw
aug END

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

set laststatus=2
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
" set rulerformat=%28(%20(%t%m%r\ %l,%c%V%)%=%P%)
set wildmenu
set wildmode=full
" set statusline=\ \%f%m%r%h%w\ ::\ %y\ [%{&ff}]\%=\ [%p%%:\ %l/%L]\
" set cmdheight=1

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
" nnoremap <Leader><SPACE> :FzfTags<CR>
nnoremap <Leader>e :FZF<CR>
nnoremap <Leader>o :FzfBTags<CR>
nnoremap <Leader>b :FzfBuffers<CR>
nnoremap <Leader>gg :FzfRg<CR>

" Rust bindings
nnoremap <silent> <Leader><Leader>r :RustFmt<CR>

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
nnoremap <Leader>q :bd<CR>
nnoremap <space> :w<CR>
nnoremap <CR> :q<CR>

nnoremap <silent> <Tab> :silent noh<CR>

" clipboard
vmap <Leader>cx :w !xsel -i -b<CR><CR>
nmap <leader>px :r !xsel -b<CR>

" fugitive bindings
" nnoremap <Leader>gs :Gstatus<CR>
" nnoremap <Leader>gd :Gdiff<CR>
" nnoremap <Leader>gb :Gblame<CR>
" nnoremap <Leader>gr :Gread<CR>
" nnoremap <Leader>gw :Gwrite<CR>

" spellchecking
map <silent> <F5> :setlocal spell! spelllang=de_at<CR>
map <silent> <F6> :setlocal spell! spelllang=en_us<CR>
