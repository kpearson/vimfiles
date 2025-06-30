" _____________________ Plugins ______________________
" ====================================================

" Setup lazy.nvim
lua << EOF
require("lazy").setup("plugins", {
  -- Configure lazy.nvim behavior
  defaults = {
    lazy = true, -- Enable lazy loading by default
  },
  install = {
    missing = true, -- Install missing plugins on startup
    colorscheme = { "onedark", "iceberg", "kuroi" },
  },
  checker = {
    enabled = true, -- Check for plugin updates
    notify = false, -- Don't notify about updates
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen", 
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
EOF

