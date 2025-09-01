return {
    "yetone/avante.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      {
        -- Render Markdown in Avante buffers
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
      -- Treesitter is both a dep and configured below as a separate spec
      { "nvim-treesitter/nvim-treesitter" },
    },
    opts = {
      build = vim.fn.has("win32") ~= 0
        and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
        or "make",
    
      mode = "agentic",
      debug = false,
      providers = {},
      web_search_engine = {},
            
      behaviour = {
        auto_focus_sidebar = true,
        auto_suggestions = true,
        auto_suggestions_respect_ignore = false,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        jump_result_buffer_on_finish = false,
        support_paste_from_clipboard = true,
        minimize_diff = true,
        enable_token_counting = true,
        use_cwd_as_project_root = true,
        auto_focus_on_diff_view = true,
      },

      hints = { enabled = true },

      rag_service = {
        enabled = false,
        host_mount = os.getenv("HOME"),
        runner = "nix",
        docker_extra_args = "",
      },

      mappings = {
        suggestion = {
          accept = "<Tab>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
        diff = {
          ours = "gH",
          theirs = "gh",
          all_theirs = "gA",
          both = "gB",
          cursor = "gc",
          next = "]x",
          prev = "[x",
        },
      },

      repo_map = {
        ignore_patterns = {
          "%.git",
          "%.worktree",
          "__pycache__",
          "node_modules",
          "target",
          "build",
          "dist",
          "BUILD",
          "ventor%.",
          "%.min%.",
          ".devenv",
        },
        negate_patterns = {},
      },

      selector = { provider = "fzf_lua" },
    },

    config = function(_, opts)
      -- Airun endpoint + models
      vim.g.airun_endpoint = "https://api-copilot.x5.ru/openai-proxy/v1"
      vim.g.airun_model = "x5-airun-medium-coder-prod"
      vim.g.airun_autocomplete_model = "x5-airun-medium-coder-prod"
      vim.g.ai_run_embedded_model = "x5-airun-multilingual-e5-large"

      local function modify_config(cfg)
        -- use Airun providers from globals
        cfg.provider = "airun"
        cfg.mode = "legacy"
        cfg.auto_suggestions_provider = "airun_autocomplete"

        cfg.providers.airun = {
          __inherited_from = "openai",
          endpoint = vim.g.airun_endpoint,
          api_key_name = "AI_RUN_TOKEN",
          model = vim.g.airun_model,
          disable_tools = true,
          allow_insecure = true,
          extra = {
            temperature = 0.7,
            max_tokens = 512,
          },
        }

        cfg.providers.airun_autocomplete = {
          __inherited_from = "openai",
          endpoint = vim.g.airun_endpoint,
          allow_insecure = true,
          api_key_name = "AI_RUN_TOKEN",
          model = vim.g.airun_autocomplete_model,
          disable_tools = true,
        }

        -- RAG off (no nix/docker wanted)
        cfg.rag_service.enabled = false
        cfg.rag_service.llm = {
          provider = "airun",
          endpoint = vim.g.airun_endpoint,
          allow_insecure = true,
          api_key = "AI_RUN_TOKEN",
          model = vim.g.airun_model,
          extra = {
            temperature = 0.7,
            max_tokens = 512,
          },
        }
        cfg.rag_service.embed = {
          provider = "airun",
          endpoint = vim.g.airun_endpoint,
          allow_insecure = true,
          api_key = "AI_RUN_TOKEN",
          model = vim.g.ai_run_embedded_model,
          extra = {
            embed_batch_size = 16,
          },
        }

        return cfg
      end

      require("avante_lib").load()
      opts = modify_config(opts)
      require("avante").setup(opts)
    end,
}
