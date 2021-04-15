" Vim color file
" Maintainer:	Eric Hodel <drbrain@segment7.net>

" For cterm mappings see:
"
"   https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim

set background=dark
set t_Co=256

hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "drbrain"

hi Normal	guifg=White		guibg=Black
hi Normal	ctermfg=White		ctermbg=Black

hi Constant	term=bold	gui=bold
hi Constant	guifg=#6feeee
hi Constant	ctermfg=Cyan

hi Comment	guifg=SteelBlue1
hi Comment	ctermfg=67

hi Conditional	term=bold	gui=bold
hi Conditional	guifg=Yellow
hi Conditional	ctermfg=Yellow

hi Define	term=bold	gui=bold
hi Define	guifg=Yellow

hi Folded	term=bold	gui=bold
hi Folded	guifg=#6feeee		guibg=Black
hi Folded	ctermfg=Cyan		ctermbg=Black

hi Function	term=bold	gui=bold
hi Function	guifg=White
hi Function	ctermfg=White

hi Identifier	guifg=#f6eeee
hi Identifier	ctermfg=Cyan

hi Number	term=bold	gui=bold
hi Number	guifg=#6feeee
hi Number	ctermfg=Cyan

hi PreProc	term=bold	gui=bold
hi PreProc	guifg=SteelBlue1
hi PreProc	ctermfg=67

hi Special	term=bold
hi Special	guifg=MediumVioletRed
hi Special	ctermfg=Red

hi Statement	term=bold	gui=bold
hi Statement	guifg=LightGoldenrod
hi Statement	ctermfg=227

hi String	term=bold
hi String	guifg=PaleGreen
hi String	ctermfg=121

hi Type		term=bold	gui=bold
hi Type		guifg=LightGreen
hi Type		ctermfg=LightGreen

" why isn't it linked up with something appropriate by default?
hi link rubyIdentifier Constant

