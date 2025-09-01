return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {     
        "lua",
        "vim",
        "vimdoc",
        "markdown",
        "yaml",                
      },
      highlight = { enable = true },
    },
  }
