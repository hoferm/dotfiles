" Author: Michael Hofer

set background=dark

hi clear
if exists('syntax_on')
	syntax reset
endif

let g:colors_name = 'rusty'

hi Normal                    guifg=#CCCCCC
hi NonText                   guifg=#404040
hi Comment                   guifg=#555555
hi SpecialComment            guifg=#555555
hi Keyword                   guifg=#ff3d23
hi Constant                  guifg=#DEA584
hi Directory                 guifg=#40BDFF
hi Identifier                guifg=#cccccc
hi Include                   guifg=#cccccc
hi PreProc                   guifg=#787878
hi Special                   guifg=#EFEFEF
hi Statement                 guifg=#CCCCCC
hi Title                     guifg=#CCCCCC
hi Type                      guifg=#CCCCCC
hi SpecialKey                guifg=#404040
hi Conditional               guifg=#dea584
hi Operator                  guifg=#AAAAAA
hi Exception                 guifg=#CCCCCC
hi Label                     guifg=#CCCCCC
hi Repeat                    guifg=#CCCCCC
hi String                    guifg=#CCCCCC
hi Character                 guifg=#CCCCCC
hi Boolean                   guifg=#CCCCCC
hi Number                    guifg=#CCCCCC
hi Function                  guifg=#cccccc
hi Underlined                guifg=#CCCCCC
hi ModeMsg                   guifg=#CCCCCC

" UI
hi ColorColumn               guifg=#CCCCCC guibg=#292929
hi Pmenu                     guifg=#EFEFEF guibg=#171717
hi PmenuSel                  guifg=#EFEFEF guibg=#dea584
hi PmenuThumb                guifg=#EFEFEF guibg=#dea584
hi StatusLine                guifg=#CCCCCC
hi StatusLineNC              guifg=#CCCCCC
hi CursorLineNr              guifg=#CCCCCC guibg=#292929 cterm=bold
hi Tabline                   guifg=#CCCCCC
hi TablineFill               guifg=#CCCCCC
hi LineNr                    guifg=#404040
hi SignColumn                guifg=#EFEFEF
hi VertSplit                 guifg=#AAAAAA
hi WildMenu                  guifg=#CCCCCC guibg=#292929
hi OverLength                guifg=NONE    guibg=#20272F

" Highlighting
hi Cursor                    guifg=#6A6A6A guibg=#EFEFEF
hi CursorIM                  guifg=#191919 guibg=#CCCCCC
hi Visual                    guifg=#191919
hi VisualNOS                 guifg=#191919
hi MatchParen                guifg=#191919 guibg=#DEA584
hi Error                     guifg=#FF3D23
hi Todo                      guifg=#DEDD5A guibg=NONE

hi Macro                     guifg=#787878

hi link rustStorage Keyword
