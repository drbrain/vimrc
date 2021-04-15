if $CDPATH != ""
  finish
endif

let raw_cdpath = system(". ~/.zshrc > /dev/null; echo -n $CDPATH")
let shell_cdpath = substitute(raw_cdpath, '[, ]', '\\\0', 'g')
let shell_cdpath = substitute(shell_cdpath, ':', ',', 'g')
let &cdpath = ',' . shell_cdpath
