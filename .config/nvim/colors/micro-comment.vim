" Author: Michael Hofer




set background=dark

hi clear
if exists('syntax_on')
   syntax reset
endif

let g:colors_name = 'micro-comment'


" ============================================================================
" Colors
" ----------------------------------------------------------------------------

" Background                  #191919
" Background (Eighties)       #2D2D2D
" Foreground                  #CCCCCC
" Invisibles                  #6A6A6A
" Comments                    #555555
" CursorLine                  #292929
" Selection                   #515151
" Variables                   #787878
" Operator                    #AAAAAA
" Function                    #EFEFEF
" Class                       #DDDDDD


" Blue Prime                  #40BDFF
" Blue Secondary              #5697B8
" Blue Tertiary               #64B2DB

" ============================================================================
" Text Markup
" ----------------------------------------------------------------------------

hi Normal                     guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=250
hi NonText                    guifg=#404040 guibg=NONE    gui=NONE      ctermfg=008
hi Comment                    guifg=#555555 guibg=NONE    gui=italic    ctermfg=243
hi SpecialComment             guifg=#555555 guibg=NONE    gui=italic    ctermfg=243
hi Constant                   guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=039
hi Directory                  guifg=#40BDFF guibg=NONE    gui=NONE      ctermfg=039
hi Identifier                 guifg=#787878 guibg=NONE    gui=NONE      ctermfg=246
hi PreProc                    guifg=#787878 guibg=NONE    gui=NONE      ctermfg=246
hi Special                    guifg=#EFEFEF guibg=NONE    gui=NONE      ctermfg=255
hi Statement                  guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=250
hi Title                      guifg=#CCCCCC guibg=NONE    gui=bold      ctermfg=250
hi Type                       guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=40
hi SpecialKey                 guifg=#404040 guibg=NONE    gui=NONE      ctermfg=039
hi Conditional                guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=039
hi Operator                   guifg=#AAAAAA guibg=NONE    gui=NONE      ctermfg=246
hi Exception                  guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=039
hi Label                      guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=039
hi Repeat                     guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=039
hi String                     guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=039
hi Character                  guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=039
hi Boolean                    guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=039
hi Number                     guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=039
hi Function                   guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=255
hi Underlined                 guifg=#CCCCCC guibg=NONE    gui=underline ctermfg=250
hi ModeMsg                    guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=039


" ============================================================================
" Highlighting
" ----------------------------------------------------------------------------

hi Cursor                     guifg=#6A6A6A guibg=#EFEFEF gui=NONE      ctermfg=008   ctermbg=255
hi CursorIM                   guifg=#191919 guibg=#CCCCCC gui=NONE      ctermfg=008   ctermbg=255
hi CursorColumn               guifg=NONE    guibg=#292929 gui=NONE      ctermfg=NONE  ctermbg=008     cterm=NONE
hi CursorLine                 guifg=NONE    guibg=#292929 gui=NONE      ctermfg=NONE  ctermbg=008     cterm=NONE
hi Visual                     guifg=#EFEFEF guibg=#515151 gui=NONE      ctermfg=255   ctermbg=008
hi VisualNOS                  guifg=#EFEFEF guibg=#515151 gui=NONE      ctermfg=255   ctermbg=008
hi IncSearch                  guifg=#EFEFEF guibg=#64B2DB gui=NONE      ctermfg=255   ctermbg=039
hi MatchParen                 guifg=#EFEFEF guibg=#40BDFF gui=NONE      ctermfg=235   ctermbg=039
hi Search                     guifg=#EFEFEF guibg=#40BDFF gui=NONE      ctermfg=255   ctermbg=039
hi Error                      guifg=#FF3D23 guibg=NONE    gui=bold      ctermfg=009   ctermbg=NONE
hi Todo                       guifg=#DEDD5A guibg=NONE    gui=bold      ctermfg=226   ctermbg=NONE

" ============================================================================
" Messages
" ----------------------------------------------------------------------------

hi Question                   guifg=#64B2DB guibg=NONE    gui=NONE      ctermfg=039   ctermbg=NONE
hi ErrorMsg                   guifg=#FB4934 guibg=NONE    gui=bold      ctermfg=009   ctermbg=NONE    cterm=bold
hi MoreMsg                    guifg=#87BF19 guibg=NONE    gui=NONE      ctermfg=002   ctermbg=NONE
hi WarningMsg                 guifg=#FB4934 guibg=NONE    gui=NONE      ctermfg=226   ctermbg=NONE




" ============================================================================
" UI
" ----------------------------------------------------------------------------

hi ColorColumn                guifg=#CCCCCC guibg=#292929 gui=bold      ctermfg=250   ctermbg=008
hi Pmenu                      guifg=#EFEFEF guibg=#191919 gui=NONE      ctermfg=255   ctermbg=000
hi PmenuSel                   guifg=#EFEFEF guibg=#40BDFF gui=NONE      ctermfg=255   ctermbg=039
hi PmenuThumb                 guifg=#EFEFEF guibg=#40BDFF gui=NONE      ctermfg=255   ctermbg=039
hi StatusLine                 guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=250   ctermbg=NONE
hi StatusLineNC               guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=250   ctermbg=NONE
hi CursorLineNr               guifg=#CCCCCC guibg=#292929 gui=bold      ctermfg=255   ctermbg=NONE    cterm=bold
hi TabLine                    guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=250   ctermbg=NONE    cterm=NONE
hi TabLineFill                guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=250   ctermbg=NONE    cterm=NONE
hi FoldColumn                 guifg=#191919 guibg=#40BDFF gui=NONE      ctermfg=235   ctermbg=039
hi Folded                     guifg=#191919 guibg=#40BDFF gui=NONE      ctermfg=235   ctermbg=039
hi LineNr                     guifg=#404040 guibg=NONE    gui=NONE      ctermfg=245   ctermbg=000
hi SignColumn                 guifg=#EFEFEF guibg=NONE    gui=NONE      ctermfg=255   ctermbg=NONE
hi VertSplit                  guifg=#AAAAAA guibg=NONE    gui=NONE      ctermfg=246   ctermbg=000
hi WildMenu                   guifg=#CCCCCC guibg=#292929 gui=NONE      ctermfg=250   ctermbg=008
hi OverLength                 guifg=NONE    guibg=#20272F gui=NONE      ctermfg=NONE  ctermbg=018

" ============================================================================
" Diff
" ----------------------------------------------------------------------------

hi DiffAdd                    guifg=#87BF19 guibg=NONE    gui=bold      ctermfg=002
hi DiffChange                 guifg=#DEDD5A guibg=NONE    gui=bold      ctermfg=226
hi DiffDelete                 guifg=#FF3D23 guibg=NONE    gui=bold      ctermfg=009
hi DiffText                   guifg=#CCCCCC guibg=NONE    gui=bold      ctermfg=250
hi GitGutterAddDefault        guifg=#87BF19 guibg=NONE    gui=NONE      ctermfg=002
hi GitGutterChangeDefault     guifg=#DEDD5A guibg=NONE    gui=NONE      ctermfg=226
hi GitGutterDeleteDefault     guifg=#FF3D23 guibg=NONE    gui=NONE      ctermfg=009




" ============================================================================
" Spelling
" ----------------------------------------------------------------------------

hi SpellBad                   guisp=#FF3D23 guibg=NONE    gui=undercurl  ctermfg=255  ctermbg=009   cterm=underline
hi SpellCap                   guisp=#87BF19 guibg=NONE    gui=undercurl  ctermfg=255  ctermbg=002   cterm=underline
hi SpellLocal                 guisp=#DEDD5A guibg=NONE    gui=undercurl  ctermfg=255  ctermbg=226   cterm=underline
hi SpellRare                  guisp=#DEDD5A guibg=NONE    gui=undercurl  ctermfg=255  ctermbg=226   cterm=underline




" ============================================================================
" Status line
" ----------------------------------------------------------------------------

hi SLCharacter                guifg=#5697B8 guibg=#151515    gui=NONE
hi SLSpecial                  guifg=#40BDFF guibg=#151515    gui=NONE
hi SLDelim                    guifg=#CCCCCC guibg=#151515    gui=NONE
hi SLNumber                   guifg=#40BDFF guibg=#151515    gui=NONE
hi SLDirectory                guifg=#40BDFF guibg=#151515    gui=NONE
hi SLIdentifier               guifg=#5697B8 guibg=#151515    gui=NONE
hi SLCharacter                guifg=#5697B8 guibg=#151515    gui=NONE
hi SLConstant                 guifg=#5697B8 guibg=#151515    gui=NONE
hi SLType                     guifg=#5697B8 guibg=#151515    gui=NONE
hi SLFunction                 guifg=#5697B8 guibg=#151515    gui=NONE
hi SLSpellBad                 guifg=#5697B8 guibg=#151515    gui=NONE
hi SLVCS                      guifg=#7F62B3 guibg=#151515    gui=NONE



" ============================================================================
" Others
" ----------------------------------------------------------------------------

hi helpSpecial                guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=250
hi helpHyperTextJump          guifg=#40BDFF guibg=NONE    gui=underline ctermfg=039
hi helpNote                   guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=250

" ============================================================================
" Specific Language Syntax
" ----------------------------------------------------------------------------

" Markdown
" ----------------------------------------------------------------------------

hi link                       markdownLinkText            PreProc
hi link                       markdownHeadingDelimiter    Number
hi link                       markdownHeader              Number
hi link                       markdownInlineCode          PreProc
hi link                       markdownFencedCodeBlock     PreProc
hi link                       markdownCodeBlock           PreProc

" Rust

