return {
  -- 1. POSITRON REPL & NOTEBOOK WORKFLOW (via Molten)
  -- Replicates Positron's interactive environment for Python/R/Julia
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version tags for stability
    build = ":UpdateRemotePlugins",
    init = function()
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
    end,
    keys = {
      { "<leader>mi", ":MoltenInit<CR>", desc = "Initialize Molten" },
      { "<leader>me", ":MoltenEvaluateOperator<CR>", desc = "Evaluate Operator" },
      { "<leader>rl", ":MoltenEvaluateLine<CR>", desc = "Evaluate Line" },
      { "<leader>rr", ":MoltenEvaluateVisual<CR>", mode = "v", desc = "Evaluate Visual" },
    },
  },

  -- 2. GHOST-TEXT COMPLETIONS (via Copilot or Supermaven)
  -- Replicates Positron's inline AI grey ghost text completion
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<Tab>", -- Replicates Positron's Tab-to-accept behavior
          accept_word = "<C-f>",
          accept_line = "<C-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<Esc>",
        },
      },
    },
  },

  -- 3. VARIABLE INSPECTION / CONSOLE SPLIT (via Iron.nvim)
  -- Gives you the side-by-side terminal console layout of Positron
  -- (Keep your previous Molten, Copilot, and Iron.nvim settings here...)

  -- 1. WEZTERM GRAPHICS SETUP (via image.nvim)
  {
    "3rd/image.nvim",
    opts = {
      backend = "kitty", -- WezTerm handles the kitty protocol perfectly
      max_width = 100,
      max_height = 12,
      max_height_window_percentage = math.huge,
      max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = true,
    },
  },

  -- 2. DATAFRAME VIEWER (via dataframes.nvim & VisiData)
  -- Replicates Positron's "View Dataframe" workspace tab
  {
    "andreiamatuni/dataframes.nvim",
    dependencies = {
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python",
    },
    keys = {
      {
        "<leader>dv",
        "<cmd>DFShowDataFrame<cr>",
        desc = "View DataFrame under Cursor",
      },
    },
    opts = {
      -- Uses VisiData in an embedded terminal layer to browse, sort, and filter lines
      viewer = "visidata",
    },
  },
}
