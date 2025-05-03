-- Basic editor behaviour
local opt = vim.opt

-- UI
opt.number         = true
-- opt.relativenumber = true
opt.cursorline     = true
opt.signcolumn     = "yes"
opt.termguicolors  = true
opt.wrap           = false
opt.splitbelow     = true
opt.splitright     = true

-- Tabs/indent
opt.tabstop     = 4
opt.shiftwidth  = 4
opt.expandtab   = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase  = true

-- Files
opt.swapfile  = false
opt.backup    = false
opt.undofile  = true

-- Performance
opt.updatetime = 250
opt.timeoutlen = 300

-- System clipboard
opt.clipboard = "unnamedplus"

