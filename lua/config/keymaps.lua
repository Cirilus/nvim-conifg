-- delete
vim.keymap.set('n', 'dd', '"_dd', { noremap = true, silent = true })
vim.keymap.set({'n', 'x'}, 'd', '"_d', { noremap = true, desc = "Delete without yanking" })
vim.keymap.set({'n', 'x'}, 'D', '"_D', { noremap = true })

-- dy => cut
vim.keymap.set('n', 'dy', 'dd', { noremap = true, silent = true })
vim.keymap.set({'n', 'x'}, '<leader>d', 'd', { noremap = true, desc = "Cut with yank" })

-- redo
vim.keymap.set('n', 'U', '<C-r>', { noremap = true, silent = true, desc = "Redo last change" })

vim.keymap.set('n', '<C-e>', ':nohlsearch<CR>', { noremap = true, silent = true, desc = "Reset the search selection" })


vim.keymap.set("n", "<leader>h", function()
  local buf = vim.api.nvim_create_buf(false, true)
  
  local lines = vim.fn.readfile(vim.fn.expand("~/.config/nvim/lua/README.md"))
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  local width = math.floor(vim.o.columns * 0.6)
  local height = math.floor(vim.o.lines * 0.6)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)
  -- Open the floating window
  vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded'
  })
end, { desc = "Popup README keymaps helper" })
