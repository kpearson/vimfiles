-- Gitsigns Configuration
-- Modern git integration with better performance than vim-signify

require('gitsigns').setup({
  signs = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged_enable = true,
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true
  },
  auto_attach = true,
  attach_to_untracked = false,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },

  -- Keymaps
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end, { desc = 'Next git hunk' })

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end, { desc = 'Previous git hunk' })

    -- Actions
    map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Stage hunk' })
    map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Reset hunk' })
    map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = 'Stage hunk' })
    map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = 'Reset hunk' })
    map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Stage buffer' })
    map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'Undo stage hunk' })
    map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Reset buffer' })
    map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Preview hunk' })
    map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end, { desc = 'Blame line' })
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Toggle line blame' })
    map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Diff this' })
    map('n', '<leader>hD', function() gitsigns.diffthis('~') end, { desc = 'Diff this ~' })
    map('n', '<leader>td', gitsigns.toggle_deleted, { desc = 'Toggle deleted' })

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Select hunk' })
  end
})

-- Set up highlighting to match your colorscheme
vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'DiffAdd' })
vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'DiffChange' })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'DiffDelete' })
vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { link = 'DiffDelete' })
vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { link = 'DiffChange' })
vim.api.nvim_set_hl(0, 'GitSignsUntracked', { link = 'Comment' })

-- Additional commands for convenience
vim.api.nvim_create_user_command('GitSignsToggle', function()
  require('gitsigns').toggle_signs()
end, { desc = 'Toggle git signs' })

vim.api.nvim_create_user_command('GitSignsBlame', function()
  require('gitsigns').blame_line({ full = true })
end, { desc = 'Show git blame for current line' })

vim.api.nvim_create_user_command('GitSignsPreview', function()
  require('gitsigns').preview_hunk()
end, { desc = 'Preview current hunk' })

-- Integration with which-key (if available)
local ok, wk = pcall(require, 'which-key')
if ok then
  wk.register({
    ['<leader>h'] = { name = 'Git Hunks' },
    ['<leader>t'] = { name = 'Toggle' },
  })
end

return {
  -- Utility functions for other configs
  get_hunks = function()
    return require('gitsigns').get_hunks()
  end,
  
  stage_hunk = function()
    return require('gitsigns').stage_hunk()
  end,
  
  reset_hunk = function()
    return require('gitsigns').reset_hunk()
  end,
}