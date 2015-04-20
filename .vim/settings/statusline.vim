" Define all the different modes
let g:currentmodetext = {
      \ 'n'  : 'NORMAL',
      \ 'no' : 'NORMAL OPERATOR PENDING',
      \ 'v'  : 'VISUAL',
      \ 'V'  : 'VISUAL LINE',
      \ '' : 'VISUAL BLOCK',
      \ 's'  : 'SELECT',
      \ 'S'  : 'SELECT Line',
      \ '' : 'SELECT Block',
      \ 'i'  : 'INSERT',
      \ 'R'  : 'REPLACE',
      \ 'Rv' : 'VISUAL REPLACE',
      \ 'c'  : 'COMMAND',
      \ 'cv' : 'VIM EX',
      \ 'ce' : 'EX',
      \ 'r'  : 'PROMPT',
      \ 'rm' : 'MORE',
      \ 'r?' : 'CONFIRM',
      \ '!'  : 'SHELL'
      \}

" Possible choices:
" http://vimdoc.sourceforge.net/htmldoc/syntax.html#cterm-colors
" NR-16   NR-8    COLOR NAME
" 0       0       Black
" 1       4       DarkBlue
" 2       2       DarkGreen
" 3       6       DarkCyan
" 4       1       DarkRed
" 5       5       DarkMagenta
" 6       3       Brown, DarkYellow
" 7       7       LightGray, LightGrey, Gray, Grey
" 8       0*      DarkGray, DarkGrey
" 9       4*      Blue, LightBlue
" 10      2*      Green, LightGreen
" 11      6*      Cyan, LightCyan
" 12      1*      Red, LightRed
" 13      5*      Magenta, LightMagenta
" 14      3*      Yellow, LightYellow
" 15      7*      White
let g:currentmodecolour = {
      \ 'n'  : 'darkgray',
      \ 'no' : 'darkgray',
      \ 'v'  : 'yellow',
      \ 'V'  : 'yellow',
      \ '' : 'yellow',
      \ 's'  : 'yellow',
      \ 'S'  : 'yellow',
      \ '' : 'yellow',
      \ 'i'  : 'green',
      \ 'R'  : 'red',
      \ 'Rv' : 'red',
      \ 'c'  : 'magenta',
      \ 'cv' : 'magenta',
      \ 'ce' : 'magenta',
      \ 'r'  : 'magenta',
      \ 'rm' : 'magenta',
      \ 'r?' : 'magenta',
      \ '!'  : 'magenta'
      \}

" Mode Indication
" Returns mode and sets color based on mode
function! SetStatusLineColor()
  execute 'hi statusline ctermfg='.g:currentmodecolour[mode()]
  return g:currentmodetext[mode()]
endfunction

set laststatus=2 "always enable status line

set statusline=[%{SetStatusLineColor()}]
set statusline+=\       "seperator
set statusline+=%t       "tail of the filename
set statusline+=\       "seperator
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag

set statusline+=%=      "left/right separator
set statusline+=%h      "help file flag
set statusline+=\       "seperator
set statusline+=[%{strlen(&fenc)?&fenc:'none'}] "file encoding
set statusline+=\       "seperator
" set statusline+=%y      "filetype
" set statusline+=\       "seperator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
