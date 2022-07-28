vim.o.background = "dark"
vim.g.tokyonight_style = "night"
vim.g.tokyonight_colors = {
  bg = "#13151F",
  bg_dark = "#0F1119",
}

vim.cmd[[colorscheme tokyonight]]

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 3

vim.opt.signcolumn = "number"

vim.opt.visualbell = true

vim.opt.showcmd = true

vim.opt.ruler = true
vim.opt.laststatus = 2
-- overridden by airline.vim
-- vim.opt.statusline="%t%(\ [%n%M]%)%(\ %H%R%W%)\ %(%c-%v,\ %l\ of\ %L,\ (%o)\ %P\ 0x%B\ (%b)%)"

vim.opt.showbreak = "> "

vim.opt.diffopt = "filler,context:8,foldcolumn:0"

vim.g.airline_theme = "deus"
