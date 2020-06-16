if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'antoinemadec/coc-fzf'

" UI enhancements
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/goyo.vim'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'pgdouyon/vim-yin-yang'
Plug 'arcticicestudio/nord-vim'

Plug 'editorconfig/editorconfig-vim'

Plug 'vim-utils/vim-cscope'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
" Plug 'coreyja/fzf.devicon.vim'
Plug 'yuki-ycino/fzf-preview.vim'

" QOL
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'
Plug 'farmergreg/vim-lastplace'
Plug 'airblade/vim-rooter'
Plug 'unblevable/quick-scope'
Plug 'mhinz/vim-startify'
" Plug 'liuchengxu/vim-which-key'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'justinmk/vim-sneak'

" Language
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'dag/vim-fish'
Plug 'sheerun/vim-polyglot'

Plug 'ryanoasis/vim-devicons'

call plug#end()
