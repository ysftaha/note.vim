" Vim syntax file
" Language: note
" Filenames: *.nt
" Maintainer: Ghoyome
" Latest Revision: 13 October 2020

if exists("b:current_syntax")
  finish
endif

"""""""""""" Headings
syn region noteHeading start="^\s*\*\s" end="$" contains=noteSpecial

"""""""""""" Inline formatting
syntax region noteBold      start="\S\zs\*\|\*\S\@="     end="\S\zs\*\|\*\S\@="  keepend oneline
syntax region noteItalic    start="\S\zs\/\|\/\S\@="     end="\S\zs\/\|\/\S\@="  keepend oneline
syntax region noteUnderline start="\S\zs_\|_\S\@="       end="\S\zs_\|_\S\@="    keepend oneline
syntax region noteStrike    start="\S\zs\~\|\~\S\@="       end="\S\zs\~\|\~\S\@=" keepend oneline
syntax region noteHigh      start="\S\zs=\|=\S\@="       end="\S\zs=\|=\S\@="    keepend oneline
syntax region noteString      start="\S\zs`\|`\S\@="       end="\S\zs`\|`\S\@="  keepend oneline

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
syn keyword noteSpecial TODO DONE FIXME NOTE TODAY

syn keyword noteDeadline DEADLINE

syn keyword noteUrgent URGENT

syn match noteComment "^\s*>.*" contains=noteSpecial,noteTag,noteDate,


call SyntaxRange#Include('habits```', '```', 'habits', 'comment')
call SyntaxRange#Include('py```', '```', 'python', 'comment')
call SyntaxRange#Include('cpp```', '```', 'cpp', 'comment')
call SyntaxRange#Include('c```', '```', 'c', 'comment')
let b:current_syntax = "note"

" TODO
" exec 'hi SyntasticErrorSign guifg=red ctermfg=red ' . (has("gui_running")? 'guibg=':'ctermbg=') . synIDattr(hlID('SignColumn'),'bg')
