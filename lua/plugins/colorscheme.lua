return {
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup({
        options = {
          styles = {
            comments = "italic",
          }
        }
      })
      vim.cmd("colorscheme carbonfox")
    end,
    priority = 1000  -- Ensure colorscheme loads first
  }
}
