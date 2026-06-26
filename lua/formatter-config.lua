-- Conform.nvim configuration for consistent formatting
-- This config aligns with Claude Code's formatter choices
local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    -- Web Development
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    vue = { "prettier" },
    svelte = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    less = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier-md" },
    graphql = { "prettier" },

    -- System Languages
    go = { "goimports", "gofmt" },
    rust = { "rustfmt" },
    python = { "ruff_format", "ruff_organize_imports" },
    ruby = { "rubocop" },

    -- Shell & Config
    sh = { "shfmt" },
    bash = { "shfmt" },
    zsh = { "shfmt" },
    fish = { "fish_indent" },

    -- Other
    lua = { "stylua" },
    dockerfile = { "dockerls" },
    sql = { "sql_formatter" },
    xml = { "xmlformat" },

    -- Fallback to LSP formatting for unspecified languages
    ["_"] = { "trim_whitespace" },
  },

  -- Format on save configuration
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },

  -- Format after save for slow formatters
  format_after_save = {
    lsp_fallback = true,
  },

  -- Notify on format errors
  notify_on_error = true,

  -- Formatter-specific settings
  formatters = {
    prettier = {
      args = {
        "--stdin-filepath",
        "$FILENAME",
        -- Let prettier find and use project's .prettierrc
        -- No hardcoded style options - respects project config
      },
    },

    -- Dedicated prettier config for markdown with 80-char line limit
    ["prettier-md"] = {
      command = "prettier",
      stdin = true,
      args = {
        "--stdin-filepath",
        "$FILENAME",
        "--print-width",
        "80",
        "--prose-wrap",
        "always",
      },
    },

    -- Ruff format uses pyproject.toml automatically
    ruff_format = {
      command = "ruff",
      args = { "format", "--stdin-filename", "$FILENAME", "-" },
    },

    ruff_organize_imports = {
      command = "ruff",
      args = { "check", "--select", "I", "--fix", "--stdin-filename", "$FILENAME", "-" },
    },

    gofmt = {
      args = { "-s" },
    },

    shfmt = {
      args = { "-i", "2", "-ci" },
    },

    stylua = {
      args = {
        "--stdin-filepath", "$FILENAME",
        "--indent-type", "Spaces",
        "--indent-width", "2",
        "--quote-style", "AutoPreferDouble",
        "--call-parentheses", "None",
        "-",
      },
    },

    rubocop = {
      args = {
        "--auto-correct",
        "--stderr",
        "--format", "quiet",
        "--stdin", "$FILENAME",
      },
    },
  },
})

-- Mason formatter installation
local ensure_installed = {
  "prettier",
  "goimports",
  "gofmt",
  "rustfmt",
  "stylua",
  "shfmt",
  "rubocop",
  "sql-formatter",
  "xmlformatter",
}

-- Auto-install formatters via Mason
local mason_tool_installer = require("mason-tool-installer")
mason_tool_installer.setup({
  ensure_installed = ensure_installed,
  auto_update = false,
  run_on_start = true,
})

-- Keymaps for manual formatting
vim.keymap.set({ "n", "v" }, "<leader>cf", function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
end, { desc = "Format file or range (in visual mode)" })

-- Show formatter info
vim.keymap.set("n", "<leader>ci", "<cmd>ConformInfo<cr>", { desc = "Conform info" })