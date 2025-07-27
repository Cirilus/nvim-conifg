return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",     -- lazy‑load on first insert
  dependencies = {
    "L3MON4D3/LuaSnip",      -- snippets engine
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "onsails/lspkind.nvim",  -- vscode‑like pictograms
  },
  config = function()
    local cmp     = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args) luasnip.lsp_expand(args.body) end,
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"]      = cmp.mapping.confirm({ select = true }),
        ["<Tab>"]     = cmp.mapping(function(fb)
          if cmp.visible() then cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
          else fb() end
        end, { "i", "s" }),
        ["<S-Tab>"]   = cmp.mapping(function(fb)
          if cmp.visible() then cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then luasnip.jump(-1)
          else fb() end
        end, { "i", "s" }),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip"  },
      }, {
        { name = "path"   },
        { name = "buffer" },
      }),

      formatting = {
        format = require("lspkind").cmp_format({
          maxwidth = 50,
          ellipsis_char = "…",
        }),
      },
    })
  end,
}
