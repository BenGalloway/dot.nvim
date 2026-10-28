return {
  -- ==========================================================================
  -- 1. UNIFIED WINDOW & REPL NAVIGATION KEYMAPS
  -- ==========================================================================
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      -- Easy directional navigation matching standard window movements
      vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
      vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
      vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })
      vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })
    end,
  },

  -- ==========================================================================
  -- 2. DUAL .ipynb & .py NOTEBOOK SUPPORT (via Jupytext)
  -- ==========================================================================
  {
    "GCBallesteros/jupytext.nvim",
    opts = {
      style = "percent",
      output_extension = "auto",
      force_ft = "python",
    },
    -- Ensures jupytext cli tool is available via Mason
    config = function(_, opts)
      require("jupytext").setup(opts)
    end,
  },

  -- ==========================================================================
  -- 3. INTERACTIVE REPL CONSOLE (Iron.nvim)
  -- ==========================================================================
  {
    "Vigemus/iron.nvim",
    main = "iron.core",
    opts = {
      config = {
        scratch_repl = true,
        repl_definition = {
          python = {
            command = { "ipython", "--no-autoindent" },
          },
        },
        repl_open_cmd = "vertical botright 60 split", -- Side-by-side terminal like Positron
      },
      keymaps = {
        send_motion = "<leader>sc",
        visual_send = "<leader>sc",
        send_file = "<leader>sf",
        clear = "<leader>cl",
      },
    },
    keys = {
      { "<leader>rs", "<cmd>IronRepl<cr>", desc = "Toggle REPL Console" },
      { "<leader>rf", "<cmd>IronFocus<cr>", desc = "Focus REPL window" },
    },
  },

  -- ==========================================================================
  -- 4. POSITRON CELL EVALUATION (Molten.nvim)
  -- ==========================================================================
  {
    "benlubas/molten-nvim",
    version = "^1.0.0",
    build = ":UpdateRemotePlugins",
    init = function()
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
      -- Treat # %% as cell boundaries for both .py and converted .ipynb files
      vim.g.molten_auto_open_output = false
    end,
    keys = {
      { "<leader>mi", ":MoltenInit<CR>", desc = "Initialize Molten" },
      { "<leader>me", ":MoltenEvaluateOperator<CR>", desc = "Evaluate Operator" },
      { "<leader>rl", ":MoltenEvaluateLine<CR>", desc = "Evaluate Line" },
      { "<leader>rr", ":MoltenEvaluateVisual<CR>", mode = "v", desc = "Evaluate Visual" },
      { "<leader>rc", "<cmd>MoltenReevaluateCell<cr>", desc = "Re-evaluate Cell" },
    },
  },

  -- ==========================================================================
  -- 5. WEZTERM INLINE IMAGE PROTOCOL
  -- ==========================================================================
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

  -- ==========================================================================
  -- 6. DATAFRAME VISUALIZATION (VisiData Integration)
  -- ==========================================================================
  {
    "andreiamatuni/dataframes.nvim",
    dependencies = { "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python" },
    keys = {
      { "<leader>dv", "<cmd>DFShowDataFrame<cr>", desc = "View DataFrame under Cursor" },
    },
    opts = { viewer = "visidata" },
  },
}
