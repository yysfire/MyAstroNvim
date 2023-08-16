return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "sindrets/diffview.nvim",
    config = function()
      require("diffview").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "linux-cultist/venv-selector.nvim",
    keys = { { "<leader>lv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
    config = function()
      local venv_selector = require("venv-selector")
      venv_selector.setup({
        name = { "venv", ".venv" },
        -- changed_venv_hooks = { venv_selector.hooks.pylsp_hook, venv_elector.hooks.pyright_hook }
      })
    end
  },
}
