return
{
  'mrcjkb/rustaceanvim',
  version = '^6', -- Recommended
  lazy = false, -- This plugin is already lazy
   config = function()
    ------------------------------------------------------------------
    -- 1. Speed up CursorHold so you don’t have to wait a full second
    ------------------------------------------------------------------
    vim.o.updatetime = 500      -- ms

    ------------------------------------------------------------------
    -- 2. Show a floating diagnostic under the cursor
    ------------------------------------------------------------------
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      callback = function()
        vim.diagnostic.open_float(nil, {
          focusable   = false,
          border      = 'rounded',
          source      = 'always',
          scope       = 'cursor',   -- only the item under the cursor
          close_events = {
            'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost',
          },
        })
      end,
      pattern = '*.rs',    -- drop this line if you want the popup in every filetype
    })

    ------------------------------------------------------------------
    -- 3. (Optional) make Rust‑specific hover actions auto‑focus
    ------------------------------------------------------------------
    vim.g.rustaceanvim = {
      tools = { hover_actions = { auto_focus = true } },
    }
  end,
}
