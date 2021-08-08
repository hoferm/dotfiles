let g:fzf_colors =
          \ { 'fg':  ['fg', 'Normal'],
            \ 'bg':  ['bg', 'Normal'],
            \ 'hl':  ['fg', 'Search'],
            \ 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+': ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+': ['fg', 'String'] }
let g:fzf_command_prefix = 'Fzf'
let $FZF_DEFAULT_COMMAND = 'fd --hidden --type f --exclude ".git"'

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  " let spec = {'options': ['--phony', '--query', a:query]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(), a:fullscreen)
endfunction

function! RgIDFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let spec = {'options': ['--select-1']}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

let g:fzf_preview_use_dev_icons = 1
let g:fzf_preview_window = 'right:60%'
let $FZF_PREVIEW_PREVIEW_BAT_THEME = 'nord'

command! -bang -nargs=* FzfRg call RipgrepFzf(<q-args>, <bang>0)
command! -bang -nargs=* FzfRgID call RipgrepFzf(<q-args>, <bang>0)

nnoremap <Leader>. :FZF<CR>
nnoremap <Leader><Leader> :CocCommand fzf-preview.ProjectFiles<CR>
nnoremap <Leader>co :FzfBTags<CR>
nnoremap <Leader>, :FzfBuffers<CR>
nnoremap <Leader>cg :CocCommand fzf-preview.ProjectGrep<CR>
nnoremap <Leader>rg :FzfRg
nnoremap <leader>ng :FzfRgID @<C-R><C-W><CR>
nnoremap <leader>nf :FzfRgID <!-- @<CR>
