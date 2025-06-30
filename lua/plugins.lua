return {
  -- ================ Search ================
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    cmd = "Telescope",
    config = function()
      require('telescope-config')
    end,
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
      { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Find word under cursor" },
      { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document symbols" },
      { "<leader>fw", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace symbols" },
      { "<c-p>", "<cmd>Telescope find_files<cr>", desc = "Find files" }, -- Keep familiar Ctrl+P
      { "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search in buffer" },
    },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  
  -- Legacy search tools (disabled)
  {
    "rking/ag.vim",
    enabled = false, -- Replaced by Telescope
  },
  {
    "kien/ctrlp.vim", 
    enabled = false, -- Replaced by Telescope
  },

  -- ================= Git ==================
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb", 
  "shumphrey/fugitive-gitlab.vim",
  "christoomey/vim-conflicted",
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require('gitsigns-config')
    end,
  },
  {
    "mhinz/vim-signify",
    enabled = false, -- Replaced by gitsigns.nvim
  },

  -- ============== Status Line ===============
  {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    config = function()
      require('lualine-config')
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  
  -- Legacy status line (disabled)
  {
    "itchyny/lightline.vim",
    enabled = false, -- Replaced by lualine
  },
  {
    "tomtom/tcomment_vim",
    keys = { "gc", "gcc" },
  },
  {
    "tpope/vim-surround",
    keys = { "cs", "ds", "ys" },
    dependencies = { "tpope/vim-repeat" },
  },
  "tpope/vim-repeat",
  {
    "bronson/vim-trailing-whitespace",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "ryanoasis/vim-devicons",
    lazy = false, -- Always load for consistent icons
  },
  {
    "editorconfig/editorconfig-vim",
    event = { "BufReadPre", "BufNewFile" },
  },

  -- =============== AI/Claude ==============
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("snacks").setup()
    end,
  },
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    keys = {
      { "<leader>a", nil, desc = "AI/Claude Code" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil" },
      },
      -- Diff management
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },

  -- ============ File Explorer =============
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus" },
    keys = {
      { "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file tree" },
      { "<leader>e", "<cmd>NvimTreeFocus<cr>", desc = "Focus file tree" },
    },
    config = function()
      require('nvim-tree-config')
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- ====== Native LSP & Completion ======
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require('lsp')
    end,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim", 
      "hrsh7th/cmp-nvim-lsp",
      "b0o/schemastore.nvim",
    },
  },
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    build = ":MasonUpdate",
  },
  "williamboman/mason-lspconfig.nvim",
  
  -- Completion Engine
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require('completion')
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer", 
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "b0o/schemastore.nvim", -- JSON/YAML schemas
    },
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
  },
  
  -- LSP Enhancements
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  
  -- Legacy CoC (disable for now, keep as fallback)
  {
    "neoclide/coc.nvim", 
    branch = "release",
    enabled = false, -- Disabled in favor of native LSP
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "josa42/vim-lightline-coc",
    },
  },

  -- ========== Syntax & Highlighting ==========
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require('treesitter-config')
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },

  -- =========== Buffer Formatting ===========
  {
    "joshdick/onedark.vim",
    priority = 1000, -- Load colorschemes early
  },
  {
    "cocopon/iceberg.vim", 
    priority = 1000,
  },
  {
    "aonemd/kuroi.vim",
    priority = 1000,
  },
  {
    "flazz/vim-colorschemes",
    priority = 1000,
    lazy = false, -- Keep available for switching
  },
  {
    "godlygeek/tabular",
    cmd = { "Tabularize" },
  },
  {
    "shime/vim-livedown",
    ft = { "markdown" },
    build = "npm install -g livedown",
  },
  
  -- Legacy syntax plugins (disabled in favor of Tree-sitter)
  {
    "sheerun/vim-polyglot",
    enabled = false, -- Replaced by Tree-sitter
  },
  {
    "othree/yajs.vim",
    enabled = false, -- Replaced by Tree-sitter
  },
  {
    "othree/javascript-libraries-syntax.vim",
    enabled = false, -- Replaced by Tree-sitter
  },
  {
    "prisma/vim-prisma",
    ft = { "prisma" }, -- Keep for now, Tree-sitter prisma is experimental
  },

  -- ========== Language Support ==========
  {
    "evanleck/vim-svelte",
    ft = { "svelte" },
  },

  -- ================ Ruby ================
  {
    "vim-ruby/vim-ruby",
    ft = { "ruby" },
  },
  {
    "tpope/vim-rails",
    ft = { "ruby" },
    dependencies = {
      "tpope/vim-bundler",
      "tpope/vim-rbenv",
    },
  },
  "tpope/vim-bundler",
  {
    "janko-m/vim-test", 
    keys = { "<leader>t" },
    cmd = { "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit" },
  },
  {
    "keith/rspec.vim",
    ft = { "ruby" },
  },
  "tpope/vim-rbenv",
  {
    "hwartig/vim-seeing-is-believing",
    ft = { "ruby" },
  },

  -- =============== Golang ===============
  {
    "fatih/vim-go",
    ft = { "go" },
    build = ":GoUpdateBinaries",
  },

  -- ================= FZF =================
  {
    "alok/notational-fzf-vim",
    enabled = false, -- Replaced by Telescope
    dependencies = {
      {
        "junegunn/fzf",
        dir = "~/.fzf", 
        build = "./install --all",
      },
    },
    keys = { "<leader>n" },
  },
}