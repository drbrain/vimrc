vim.g.guioptions = "aegir"
vim.g.mousehide = true
vim.g.neovide_cursor_smooth_blink = false
vim.g.neovide_cursor_trail_size = 0.4
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_cursor_vfx_particle_curl = 0.5
vim.g.neovide_cursor_vfx_particle_density = 20.0
vim.g.neovide_cursor_vfx_particle_lifetime = 2.0
vim.g.neovide_cursor_vfx_particle_phase = 5.0
vim.g.neovide_cursor_vfx_particle_speed = 50.0
vim.g.neovide_hide_mouse_when_typing = true
vim.o.guicursor = "ci-cr-i-r:blinkwait500-blinkon500-blinkoff800"
vim.o.guifont = "Monaspace Neon:h12"

if vim.g.neovide then
  vim.keymap.set('n', '<D-s>', ':w<CR>')      -- Save
  vim.keymap.set('v', '<D-c>', '"+y')         -- Copy
  vim.keymap.set('n', '<D-v>', '"+P')         -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P')         -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+')      -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode

  vim.g.neovide_scale_factor = 1.0
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.25)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.25)
  end)
end
