let g:fzf_colors =
          \ { 'fg':  ['fg', 'Normal'],
            \ 'bg':  ['bg', 'Normal'],
            \ 'hl':  ['fg', 'Type'],
            \ 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+': ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+': ['fg', 'String'] }
let g:fzf_command_prefix = 'Fzf'
let $FZF_DEFAULT_COMMAND = 'fd --hidden --type f --exclude ".git/"'

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --ignore --hidden --follow --color "auto"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf,rs,lua}"
  \ -g "!{.git,node_modules,vendor}/*" '

let g:fzf_preview_use_dev_icons = 1

command! -bang -nargs=* FzfRg call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

nnoremap <Leader>. :FZF<CR>
nnoremap <Leader><Leader> :FzfPreviewProjectFiles<CR>
nnoremap <Leader>co :FzfPreviewBufferTags<CR>
nnoremap <Leader>, :FzfPreviewBuffers<CR>
nnoremap <Leader>cg :FzfPreviewProjectCommandGrep<CR>
