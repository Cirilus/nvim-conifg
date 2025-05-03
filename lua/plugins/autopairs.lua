-- lua/plugins/pairs.lua
return {
  -- 1) disable built‑in mini.pairs
  { "echasnovski/mini.pairs", enabled = false },

  -- 2) enable nvim‑autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts  = true,   -- Treesitter aware
      fast_wrap = {},     -- <Alt‑e> then a key to wrap the text
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)

      -- optional: auto‑pair after cmp confirmation
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}

