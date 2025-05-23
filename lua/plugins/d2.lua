return {
  {
    "terrastruct/d2-vim",
    ft = "d2",  -- Only load for D2 files
  },

  -- image backend
  {
    "3rd/image.nvim",
    build = false,                       -- we use magick_cli
    opts = {
      backend   = "kitty",               -- or "ueberzug"/"sixel" if not in Kitty
      processor = "magick_cli",
      max_height_window_percentage = 60,
      max_width_window_percentage  = 60,

      -- tmux‑specific tweaks
      tmux = {
        enabled                = true,
        show_only_in_active_window = true,
      },
      window_overlap_clear_enabled = true,
    },
  },
    {
      "3rd/diagram.nvim",
      ft = { "d2", "markdown", "norg" },
      dependencies = { "3rd/image.nvim" },
      opts = {
        events = {
          render_buffer = { "InsertLeave", "BufWritePost", "TextChanged" },
          clear_buffer  = { "BufLeave" },
        },
        renderer_options = {
          d2 = {
            theme_id = 0,
            layout = "elk",
            scale = 1,
            -- Consider adding more options
            sketch = false,  -- Try true for sketch mode
          },
        },
      },
    }
}
