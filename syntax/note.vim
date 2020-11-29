" Vim syntax file
" Language: note
" Filenames: *.nt
" Maintainer: ysftaha
" Latest Revision: 28 Nov 2020

if exists("b:current_syntax")
  finish
endif

syn spell   toplevel

"""""""""""" Headings
syn region noteHeading start="^\s*\*\s" end="$" contains=noteSpecial

"""""""""""" Inline formatting
syntax region noteBold        start="\S\zs\*\|\*\S\@="     end="\S\zs\*\|\*\S\@="  keepend oneline
syntax region noteItalic      start="\S\zs\/\|\/\S\@="     end="\S\zs\/\|\/\S\@="  keepend oneline
syntax region noteUnderline   start="\S\zs_\|_\S\@="       end="\S\zs_\|_\S\@="    keepend oneline
syntax region noteStrike      start="\S\zs\~\|\~\S\@="     end="\S\zs\~\|\~\S\@="  keepend oneline
syntax region noteHigh        start="\S\zs=\|=\S\@="       end="\S\zs=\|=\S\@="    keepend oneline
syntax region noteString      start="\S\zs`\|`\S\@="       end="\S\zs`\|`\S\@="    keepend oneline

"""""""""""" Tags & dates
" Tag
syntax match noteTag  "#\w*"

" date
syntax region noteDate      start="\S\zs<\|<\S\@="       end="\S\zs>\|>\S\@="  keepend oneline


"""""""""""" Lists
" unordered list item bullet
syn match noteUlist "^\s*-\(\s\|$\)"

" ordered list item bullet
syn match noteOlist "^\s*\(\a\|\d\+\)[.)]\(\s\|$\)"


"""""""""""" Checkboxes
" checkbox
syn match noteCheckBox "^\(\s*-\s\|\s*\)\[\(\s\|x\|-\)\]\s\+" 

" FIXME the following regions can probably be improved
" checklist item done
syn region noteCheckBoxItemDone start="^\(\s*-\s\|\s*\)\[x\]\(\s\|$\)\+" end="\(\ze\s#\|\ze\s<.*>\|$\)" 
      \ contains=noteCheckBox,noteTag,noteDate,noteSpecial oneline

" checklist item cancelled
syn region noteCheckBoxItemCacelled start="^\(\s*-\s\|\s*\)\[-\]\(\s\|$\)\+" end="\(\ze\s#\|\ze\s<.*>\|$\)" 
      \ contains=noteCheckBox,noteTag,noteDate,noteSpecial oneline

"""""""""""" Coments
syn match noteSpecial "TODO\|FIXME\|DONE\|DEADLINE\|@returns\|@return\|@param\|@brief\|@note"

syn match noteComment "^\s*>.*" contains=noteSpecial,noteTag,noteDate,

call SyntaxRange#Include('habits```', '```', 'habits', 'Ignore')
call SyntaxRange#Include('py```', '```', 'python', 'Ignore')
call SyntaxRange#Include('cpp```', '```', 'cpp', 'Ignore')
call SyntaxRange#Include('c```', '```', 'c', 'Ignore')

hi def link noteHeading Title

hi def noteBold      term=BOLD cterm=BOLD gui=BOLD 
hi def noteItalic    term=ITALIC cterm=ITALIC gui=ITALIC
hi def noteUnderline term=UNDERLINE cterm=UNDERLINE gui=UNDERLINE
hi def noteStrike    term=STRIKETHROUGH cterm=STRIKETHROUGH gui=STRIKETHROUGH
hi def noteHigh      cterm=REVERSE term=REVERSE gui=REVERSE

if synIDtrans(hlID('diffAdded')) " check for diff legacy colors
  hi def link noteCheckBoxItemDone     diffAdded
  hi def link noteCheckBoxItemCacelled diffRemoved
else 
  hi def link noteCheckBoxItemDone     DiffAdd
  hi def link noteCheckBoxItemCacelled DiffDelete
endif

hi def link noteTag Tag
hi def link noteDate Keyword

hi def link noteSpecial Todo
hi def link noteComment Comment
hi def link noteString String
hi def link noteUlist Statement
hi def link noteOlist Statement
hi def link noteCheckBox Statement

let b:current_syntax = "note"
