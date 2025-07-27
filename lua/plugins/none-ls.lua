return {
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      {
        "<leader>t",
        function()
          vim.lsp.buf.format({
            async = true,
            filter = function(client) return client.name == "null-ls" end,
          })
        end,
        desc = "Format (none-ls: goimports + gofumpt)",
      },
    },
    opts = function()
      local null_ls = require("null-ls")

      local function module_path()
        local gomod = vim.fs.find("go.mod", { upward = true, type = "file" })[1]
        if not gomod then return nil end
        for line in io.lines(gomod) do
          local m = line:match("^module%s+(.+)$")
          if m then return m end
        end
      end
      local mod = module_path()
      local goimports_args = { "-srcdir", "$DIRNAME" }
      if mod then
        table.insert(goimports_args, "-local")
        table.insert(goimports_args, mod)
      end

      return {
        sources = {
          null_ls.builtins.formatting.goimports.with({ args = goimports_args }),
          null_ls.builtins.formatting.gofumpt,
        },
      }
    end,
  },

  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = { "goimports", "gofumpt" },
      automatic_installation = true,
    },
  },
}
