return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'milanglacier/minuet-ai.nvim' },
  opts = function(_, opts)
    opts.sections = opts.sections or {}

    -- ensure required sections exist
    opts.sections.lualine_c = opts.sections.lualine_c or {}
    opts.sections.lualine_x = opts.sections.lualine_x or {}

    -- show full file path in lualine_c
    table.insert(opts.sections.lualine_c, {
      'filename',
      path = 1,  -- 0 = name, 1 = relative path, 2 = absolute path
      shorting_target = 50,  -- optional: shorten if too long
      symbols = {
        modified = ' [+]',    -- text when file is modified
        readonly = ' [RO]',   -- text when file is read-only
        unnamed  = '[No Name]',
      },
    })

  end,
}
