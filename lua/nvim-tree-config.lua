-- Nvim-tree Configuration
-- Modern file explorer replacement for CoC explorer

-- Disable netrw (Vim's built-in file explorer)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable 24-bit color
vim.opt.termguicolors = true

local nvim_tree = require('nvim-tree')

nvim_tree.setup({
  -- Disable startup message
  disable_netrw = true,
  hijack_netrw = true,
  
  -- Auto close when last window
  auto_reload_on_write = true,
  
  -- Update the focused file on `BufEnter`, un-collapses the folders recursively until the file is found
  update_focused_file = {
    enable = true,
    update_root = false,
    ignore_list = {},
  },
  
  -- Disable LSP diagnostics in the tree to avoid conflicts
  -- Diagnostics are already shown in the editor via LSP
  diagnostics = {
    enable = false,
  },
  
  -- Git integration
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  
  -- File system watcher
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50,
  },
  
  -- View options
  view = {
    width = 35,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    float = {
      enable = false,
      quit_on_focus_loss = true,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 50,
        height = 30,
        row = 1,
        col = 1,
      },
    },
  },
  
  -- Renderer options
  renderer = {
    add_trailing = false,
    group_empty = true,
    highlight_git = true,
    full_name = false,
    highlight_opened_files = "name",
    root_folder_label = ":t",
    indent_width = 2,
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        none = " ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "package.json" },
    symlink_destination = true,
  },
  
  -- Filters
  filters = {
    dotfiles = false,
    custom = { "^.git$", "node_modules", ".cache" },
    exclude = { ".gitignore", ".env.example" },
  },
  
  -- Actions
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
      exclude = {},
    },
    file_popup = {
      open_win_config = {
        col = 1,
        row = 1,
        relative = "cursor",
        border = "shadow",
        style = "minimal",
      },
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        picker = "default",
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
  
  -- Tab behavior
  tab = {
    sync = {
      open = false,
      close = false,
      ignore = {},
    },
  },
  
  -- Notification settings
  notify = {
    threshold = vim.log.levels.INFO,
  },
  
  -- Log settings
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      dev = false,
      diagnostics = false,
      git = false,
      profile = false,
      watcher = false,
    },
  },
  
  -- Attach custom keymaps
  on_attach = on_attach,
})

-- Auto-close nvim-tree when it's the last window
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})

-- Global keymaps (available everywhere)
vim.keymap.set('n', '<leader>tt', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle file tree' })
vim.keymap.set('n', '<leader>tf', '<cmd>NvimTreeFindFile<cr>', { desc = 'Find current file in tree' })
vim.keymap.set('n', '<leader>tc', '<cmd>NvimTreeCollapse<cr>', { desc = 'Collapse file tree' })

-- Function to set up buffer-local keymaps when nvim-tree opens
local function on_attach(bufnr)
  local api = require "nvim-tree.api"
  
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- Custom mappings
  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 's', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', 't', api.node.open.tab, opts('Open: New Tab'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end