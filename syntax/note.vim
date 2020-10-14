" Vim syntax file
" Language: note
" Filenames: *.nt
" Maintainer: Ghoyome
" Latest Revision: 13 October 2020

if exists("b:current_syntax")
  finish
endif

"""""""""""" Headings
syn region noteHeading start="^\s*\*\s" end="$"
hi def link noteHeading Type

"""""""""""" Inline formatting
" bold
syntax region noteBold      start="\S\zs\*\|\*\S\@="     end="\S\zs\*\|\*\S\@="  keepend oneline
hi def noteBold term=BOLD cterm=BOLD gui=BOLD

" italic
syntax region noteItalic    start="\S\zs\/\|\/\S\@="     end="\S\zs\/\|\/\S\@="  keepend oneline
hi def noteItalic term=ITALIC cterm=ITALIC gui=ITALIC

" underline
syntax region noteUnderline start="\S\zs_\|_\S\@="       end="\S\zs_\|_\S\@="    keepend oneline
hi def noteUnderline term=UNDERLINE cterm=UNDERLINE gui=UNDERLINE

" strikethrough
syntax region noteStrike    start="\S\zs\~\|\~\S\@="       end="\S\zs\~\|\~\S\@=" keepend oneline
hi def noteStrike term=STRIKETHROUGH cterm=STRIKETHROUGH gui=STRIKETHROUGH

" highlight
syntax region noteHigh      start="\S\zs=\|=\S\@="       end="\S\zs=\|=\S\@="    keepend oneline
hi def noteHigh cterm=STANDOUT term=STANDOUT gui=STANDOUT

" string
syntax region noteString      start="\S\zs`\|`\S\@="       end="\S\zs`\|`\S\@="  keepend oneline
hi def link noteString String


"""""""""""" Tags & dates
" Tag
syntax region noteTag      start="#"       end="\ze\s"    keepend oneline
hi def link noteTag MatchParen

" date
syntax region noteDate      start="\S\zs<\|<\S\@="       end="\S\zs>\|>\S\@="  keepend oneline
hi def noteDate cterm=BOLD gui=BOLD term=BOLD ctermfg=White guifg=#FFFFFF


"""""""""""" Lists
" unordered list item bullet
syn match noteUlist "^\s*-\(\s\|$\)"
hi def link noteUlist Identifier

" ordered list item bullet
syn match noteOlist "^\s*\(\a\|\d\+\)[.)]\(\s\|$\)"
hi def link noteOlist Identifier


"""""""""""" Checkboxes
" checkbox
syn match noteCheckBox "^\(\s*-\s\|\s*\)\[\(\s\|X\|-\)\]\s\+" 
hi def link noteCheckBox Identifier


" checklist item

" checklist item done
syn region noteCheckBoxItemDone start="^\(\s*-\s\|\s*\)\[X\]\(\s\|$\)\+" end="\($\|\ze\s#\)" 
      \ contains=noteCheckBox,noteTag,noteDate oneline
hi def noteCheckBoxItemDone ctermfg=42 guifg=#FFa0a0 cterm=STRIKETHROUGH gui=STRIKETHROUGH

" checklist item cancelled
syn region noteCheckBoxItemCacelled start="^\(\s*-\s\|\s*\)\[-\]\(\s\|$\)\+" end="\($\|\ze\s#\)" 
      \ contains=noteCheckBox,noteTag,noteDate oneline
hi def noteCheckBoxItemCacelled ctermfg=Red guifg=#FF0000 cterm=STRIKETHROUGH  gui=STRIKETHROUGH

"""""""""""" Coments
syn keyword noteSpecial TODO FIXME REVISE RESCHEDULE EXPAND
hi def link noteSpecial Todo

syn match noteComment "^\s*>.*" contains=noteSpecial
hi def link noteComment Comment

let b:current_syntax = "note"
