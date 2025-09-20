-- Telescope Configuration
local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    -- Default configuration for telescope goes here:
    prompt_prefix = "🔍 ",
    selection_caret = "➤ ",
    entry_prefix = "  ",
    multi_icon = "📌",
    
    -- File ignore patterns
    file_ignore_patterns = {
      "node_modules/.*",
      "%.git/.*",
      "%.DS_Store",
      "%.o",
      "%.a",
      "%.out",
      "%.class",
      "%.pdf",
      "%.mkv",
      "%.mp4", 
      "%.zip",
    },
    
    -- Layout configuration
    layout_config = {
      horizontal = {
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    
    -- Mappings for telescope
    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },
      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["?"] = actions.which_key,
      },
    },
  },

  pickers = {
    -- Default configuration for builtin pickers goes here:
    find_files = {
      theme = "dropdown",
      previewer = true,
      hidden = false,
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
    },

    live_grep = {
      additional_args = function(opts)
        return {"--hidden"}
      end
    },

    grep_string = {
      additional_args = function(opts)
        return {"--hidden"}
      end
    },

    buffers = {
      theme = "dropdown",
      previewer = false,
      sort_lastused = true,
      sort_mru = true,
    },

    oldfiles = {
      theme = "dropdown",
      previewer = false,
    },

    help_tags = {
      theme = "ivy",
    },

    -- LSP pickers
    lsp_references = {
      theme = "ivy",
    },

    lsp_document_symbols = {
      theme = "dropdown",
    },

    lsp_workspace_symbols = {
      theme = "dropdown",
    },
  },

  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
})

-- Load extensions
telescope.load_extension('fzf')

-- Custom functions for advanced searching
local M = {}

-- Search in git files only
M.git_files = function()
  local git_files = require('telescope.builtin').git_files
  local find_files = require('telescope.builtin').find_files
  
  local ok = pcall(git_files, {})
  if not ok then
    find_files()
  end
end

-- Search for files by extension
M.find_files_by_extension = function(ext)
  require('telescope.builtin').find_files({
    find_command = { "rg", "--files", "--glob", "*." .. ext }
  })
end

-- Search in current buffer
M.current_buffer_fuzzy_find = function()
  require('telescope.builtin').current_buffer_fuzzy_find({
    theme = "ivy"
  })
end

-- Live grep in open buffers
M.live_grep_in_buffers = function()
  require('telescope.builtin').live_grep({
    grep_open_files = true
  })
end

return M
