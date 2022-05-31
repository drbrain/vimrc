" For https://github.com/gelguy/wilder.nvim
call wilder#setup({'modes': [':', '/', '?']})

"call wilder#set_option('renderer', wilder#wildmenu_renderer(
"      \ wilder#wildmenu_airline_theme({
"      \   'highlighter': wilder#basic_highlighter(),
"      \   'highlights': {
"      \     'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#bb7cd7'}]),
"      \   },
"      \ })))

call wilder#set_option(
  \ 'renderer',
  \ wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
  \   'border': 'rounded',
  \   'highlighter': wilder#basic_highlighter(),
  \   'highlights': {
  \     'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#bb7cd7'}]),
  \     'border': 'Normal',
  \   },
  \   'left': [
  \     ' ', wilder#popupmenu_devicons(),
  \   ],
  \   'right': [
  \     ' ', wilder#popupmenu_scrollbar(),
  \   ],
  \ })))

