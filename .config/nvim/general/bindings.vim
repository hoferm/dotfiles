let mapleader = " "

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
nnoremap <Leader>w- :hide<CR>
" Move between panes
nnoremap <Leader>wk <C-W><up>
nnoremap <Leader>wj <C-W><down>
nnoremap <Leader>wh <C-W><left>
nnoremap <Leader>wl <C-W><right>
nnoremap <Leader>wr <C-W>r
" Resize windows
nnoremap <Leader>w= <C-W>=

" incsearch for range commands
cnoremap $t <CR>:t''<CR>:noh<CR>
cnoremap $m <CR>:m''<CR>:noh<CR>
cnoremap $d <CR>:d<CR>``

" nnoremap <silent> <Leader>t :<C-U>call Z_CopyLine()<CR>
nnoremap <silent> <Leader>T :<C-U>call Z_CopyLineTo()<CR>==
nnoremap <silent> <Leader>m :<C-U>call Z_MoveLine()<CR>
nnoremap <silent> <Leader>M :<C-U>call Z_MoveLineTo()<CR>==
nnoremap <silent> <Leader>d :<C-U>call Z_DeleteLine()<CR>``

" Buffer specific bindings
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bs :w<CR>
nnoremap <Leader>fs :w<CR>
nnoremap <Leader>q :q<CR>

" Hide search highlighting
nnoremap <silent> <Leader><Tab> :silent noh<CR>

nnoremap <Tab> za

nnoremap j gj
nnoremap k gk
nnoremap n nzz
nnoremap N Nzz
nnoremap <C-U> <C-U>zz
nnoremap <C-D> <C-D>zz

nnoremap zo o<CR>

nnoremap 0 ^
nnoremap ^ 0

" inoremap {<CR> {<CR>}<Esc>O
" inoremap [<CR> [<CR>]<Esc>O
" inoremap (<CR> (<CR>)<Esc>O

inoremap <Esc> <Esc>
nnoremap <Esc> <Esc>
vnoremap <Esc> <Esc>

" Stay in visual mode when changing indentation
vnoremap < <gv
vnoremap > >gv

nnoremap Y y$
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P

nnoremap <silent> <Leader>xt call SynGroup()<CR>

" Markdown add timestamp
nnoremap <Leader>nt m'A<a name="<C-R>=strftime('%Y%m%dT%H%M%S')<CR>"></a> <!-- @<C-R>=strftime('%Y%m%dT%H%M%S')<CR> --><ESC>

"Spellchecking
map <silent> <F5> :setlocal spell! spelllang=de_at<CR>
map <silent> <F6> :setlocal spell! spelllang=en_us<CR>
