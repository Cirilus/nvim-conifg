return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'milanglacier/minuet-ai.nvim' },
  opts = function(_, opts)
    -- keep any sections you already had
    opts.sections = opts.sections or {}

    -- ensure lualine_x exists
    opts.sections.lualine_x = opts.sections.lualine_x or {}

    -- insert Minuet status at the front, keep filetype after it
    table.insert(opts.sections.lualine_x, 1, require('minuet.lualine'))
    table.insert(opts.sections.lualine_x, 'filetype')
  end,
}
