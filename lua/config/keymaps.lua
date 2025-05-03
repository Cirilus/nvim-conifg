-- delete
vim.keymap.set('n', 'dd', '"_dd', { noremap = true, silent = true })
vim.keymap.set({'n', 'x'}, 'd', '"_d', { noremap = true, desc = "Delete without yanking" })
vim.keymap.set({'n', 'x'}, 'D', '"_D', { noremap = true })
-- dy => cut
vim.keymap.set('n', 'dy', 'dd', { noremap = true, silent = true })
vim.keymap.set({'n', 'x'}, '<leader>d', 'd', { noremap = true, desc = "Cut with yank" })
