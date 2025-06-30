-- Lualine Configuration
local lualine = require('lualine')

-- Custom functions migrated from lightline
local function fugitive()
  local head = vim.fn['FugitiveHead']()
  if head ~= '' then
    return ' ' .. head
  else
    return ''
  end
end

local function readonly()
  if vim.bo.readonly and vim.bo.filetype ~= 'help' then
    return ''
  else
    return ''
  end
end

local function filename()
  local fname = vim.fn.expand('%:t')
  if fname == '' then
    return '[No Name]'
  else
    return fname
  end
end

-- LSP diagnostics with icons
local function lsp_diagnostics()
  if not vim.diagnostic then
    return ''
  end
  
  local counts = vim.diagnostic.count(0)
  local errors = counts[vim.diagnostic.severity.ERROR] or 0
  local warnings = counts[vim.diagnostic.severity.WARN] or 0
  local info = counts[vim.diagnostic.severity.INFO] or 0
  local hints = counts[vim.diagnostic.severity.HINT] or 0
  
  local status = ''
  if errors > 0 then
    status = status .. ' ' .. errors .. ' '
  end
  if warnings > 0 then
    status = status .. ' ' .. warnings .. ' '
  end
  if info > 0 then
    status = status .. ' ' .. info .. ' '
  end
  if hints > 0 then
    status = status .. ' ' .. hints .. ' '
  end
  
  return status
end

-- LSP server status
local function lsp_status()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients == 0 then
    return ''
  end
  
  local client_names = {}
  for _, client in ipairs(clients) do
    table.insert(client_names, client.name)
  end
  
  return ' ' .. table.concat(client_names, ', ')
end

-- Git diff status
local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

-- Custom mode names with icons
local mode_map = {
  ['n'] = ' NORMAL',
  ['no'] = ' N-PENDING',
  ['i'] = ' INSERT',
  ['ic'] = ' INSERT',
  ['t'] = ' TERMINAL',
  ['v'] = ' VISUAL',
  ['V'] = ' V-LINE',
  [''] = ' V-BLOCK',
  ['R'] = ' REPLACE',
  ['Rv'] = ' V-REPLACE',
  ['s'] = ' SELECT',
  ['S'] = ' S-LINE',
  [''] = ' S-BLOCK',
  ['c'] = ' COMMAND',
  ['cv'] = ' VIM-EX',
  ['ce'] = ' EX',
  ['r'] = ' PROMPT',
  ['rm'] = ' MORE',
  ['r?'] = ' CONFIRM',
  ['!'] = ' SHELL',
}

local function mode()
  local m = vim.api.nvim_get_mode().mode
  return mode_map[m] or ' ' .. m:upper()
end

-- Configure lualine
lualine.setup({
  options = {
    icons_enabled = true,
    theme = 'auto', -- Auto-detect based on colorscheme
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  
  sections = {
    lualine_a = {
      {
        mode,
        separator = { left = '' },
        right_padding = 2,
      },
    },
    lualine_b = {
      {
        'branch',
        icon = '',
      },
      {
        'diff',
        source = diff_source,
        symbols = { added = ' ', modified = ' ', removed = ' ' },
      }
    },
    lualine_c = {
      {
        'filename',
        file_status = true,     -- Displays file status (readonly status, modified status)
        newfile_status = false, -- Display new file status (new file means no write after created)
        path = 1,              -- 0: Just the filename, 1: Relative path, 2: Absolute path, 3: Absolute path, with tilde as the home directory
        shorting_target = 40,   -- Shortens path to leave 40 spaces for other components
        symbols = {
          modified = '[+]',      -- Text to show when the file is modified
          readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly
          unnamed = '[No Name]', -- Text to show for unnamed buffers
          newfile = '[New]',     -- Text to show for newly created file before first write
        }
      },
      {
        lsp_diagnostics,
        color = { gui = 'bold' },
      }
    },
    lualine_x = {
      {
        lsp_status,
        icon = '',
        color = { fg = '#7aa2f7' },
      },
      'encoding',
      'fileformat',
      'filetype'
    },
    lualine_y = {
      {
        'progress',
        separator = { right = '' },
        left_padding = 2,
      }
    },
    lualine_z = {
      {
        'location',
        separator = { right = '' },
        left_padding = 2,
      }
    }
  },
  
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  
  extensions = {
    'fugitive',
    'lazy',
    'nvim-tree',
  }
})

-- Set up autocommands for dynamic updates
local augroup = vim.api.nvim_create_augroup('LualineConfig', { clear = true })

-- Update lualine when LSP attaches/detaches
vim.api.nvim_create_autocmd('LspAttach', {
  group = augroup,
  callback = function()
    require('lualine').refresh()
  end,
})

vim.api.nvim_create_autocmd('LspDetach', {
  group = augroup,
  callback = function()
    require('lualine').refresh()
  end,
})

-- Update lualine when diagnostics change
vim.api.nvim_create_autocmd('DiagnosticChanged', {
  group = augroup,
  callback = function()
    require('lualine').refresh()
  end,
})

return {
  -- Utility functions for other configs
  lsp_diagnostics = lsp_diagnostics,
  lsp_status = lsp_status,
}