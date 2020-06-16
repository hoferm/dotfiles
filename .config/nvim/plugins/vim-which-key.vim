call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey '\\'<CR>

let g:which_key_map = {}

let g:which_key_map['w'] = {
            \ 'name' : '+windows',
            \ 'v' : 'split window right',
            \ 's' : 'split window below',
            \ 'c' : 'close window',
            \ 'o' : 'window-only',
            \ '-' : 'hide window',
            \ 'k' : 'window up',
            \ 'j' : 'window down',
            \ 'h' : 'window left',
            \ 'l' : 'window right',
            \ 'r' : '?',
            \ '=' : 'resize windows',
            \ }

let g:which_key_map['b'] = {
            \ 'name' : '+buffers',
            \ 'd' : 'delete buffer',
            \ 's' : 'save buffer',
            \ }

let g:which_key_map['f'] = {
            \ 'name' : '+files',
            \ 's' : 'save file',
            \ }

let g:which_key_map['c'] = {
            \ 'name' : '+code',
            \ 'd' : 'definition',
            \ 'y' : 'type definition',
            \ 'i' : 'implementation',
            \ 'r' : 'references',
            \ 'o' : 'outline',
            \ 'co': 'coc outline',
            \ 'a' : 'action',
            \ 'g' : 'grep',
            \ 'p' : 'preview hunk',
            \ 's' : 'stage hunk',
            \ 'u' : 'undo hunk',
            \ 'v' : 'GV',
            \ }

let g:which_key_map['g'] = {
            \ 'name' : '+git',
            \ 'c' : 'checkout branch',
            \ 'g' : 'status',
            \ 'd' : 'diff',
            \ 'b' : 'blame',
            \ 'r' : 'Gread',
            \ 'w' : 'Gwrite',
            \ 'h' : 'diffget left',
            \ 'l' : 'diffget right',
            \ }

let g:which_key_map['<space>'] = 'project files'
let g:which_key_map[','] = 'buffers'
let g:which_key_map['.'] = 'find file'
let g:which_key_map['<TAB>'] = 'which_key_ignore'
