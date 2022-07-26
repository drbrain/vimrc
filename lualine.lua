require('lualine').setup({
  options = {
    theme = 'tokyonight'
  },
  sections = {
    lualine_x = {
      {
        'filetype',
        icon_only = true,
      }
    }
  }
})

