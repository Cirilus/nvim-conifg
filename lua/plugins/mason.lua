return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",          -- `:Lazy update` will pull new binaries, too
  dependencies = {
    "williamboman/mason-lspconfig.nvim", -- Mason ↔︎ lspconfig bridge
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup()

    local mason_lsp = require("mason-lspconfig")
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local util        = require("lspconfig.util")
    -- One‑liner handler → every server gets the same defaults
    mason_lsp.setup_handlers({
      function(server)
        lspconfig[server].setup({ capabilities = capabilities })
      end,

	-- python
	pyright = function()
	  local root = util.root_pattern("pyproject.toml", ".git")(vim.fn.getcwd()) or vim.fn.getcwd()

	  lspconfig.pyright.setup({
	    capabilities = capabilities,
	    root_dir = root,
	    settings = {
	      python = {
		venvPath = root,   -- “.” works too, but this is explicit
		venv     = ".venv",
		analysis = {
		  autoSearchPaths        = true,
		  useLibraryCodeForTypes = true,
		  diagnosticMode         = "workspace",
		},
	      },
	    },
	  })
	end,	

	ruff = function()
        lspconfig.ruff.setup({
          capabilities = capabilities,
          root_dir = util.root_pattern("pyproject.toml", "ruff.toml", ".git"),
          init_options = {         -- optional: tweak Ruff itself
            settings = {
              args = {},           -- extra CLI flags → {"--select", "I001"}
            },
          },
          on_attach = function(client, _)
            ----------------------------------------------------------------
            -- Ruff overlaps Pyright on hover; let Pyright own that ability
            ----------------------------------------------------------------
            client.server_capabilities.hoverProvider = false
          end,
        })
      end,
	-- lua
	lua_ls = function()        -- custom rules ONLY for lua_ls
		local home = vim.loop.os_homedir()

		lspconfig.lua_ls.setup({
		capabilities = capabilities,
		-- skip if root would be $HOME
		root_dir = function(fname)
		local root =
		  util.root_pattern(".luarc.json", ".luacheckrc", ".stylua.toml", "init.lua")(fname)
		  or util.find_git_ancestor(fname)

		if root == home then return nil end   -- tell LSP “no project”
		return root or util.path.dirname(fname)
		end,

		settings = {
		Lua = {
		  workspace = { checkThirdParty = false }, -- stop nagging about luassert/etc.
		  telemetry = { enable = false },
		},
		},
		})
	end,
    })
  end,
}

