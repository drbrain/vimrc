runtime ftplugin/changelog.vim

let g:changelog_username="Eric Hodel  <drbrain@segment7.net>"

function! s:setup_ruby_trunk()
  let path = expand('%:p:h')
  let name = 'ruby.c'

  while isdirectory(path)
    let ruby = path . '/' . name
    if filereadable(name)
      break
    endif
    let parent = substitute(path, '/\+[^/]*$', "", "")
    if path == parent
      break
    endif
    let path = parent
  endwhile

  if !filereadable(name) && !filereadable('README.EXT')
    return
  endif

  if !exists('*b:changelog_dateformat_func')
    function b:changelog_dateformat_func()
      " Japan is 57600 seconds ahead of Pacific Time
      let date = system("TZ=Japan date +'%a %b %e %T %Y'")
      return substitute(date, "\\\n", "", "")
    endfunction
  endif
endfunction

