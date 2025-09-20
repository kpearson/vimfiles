-- Utility functions for Neovim

local M = {}

function M.copy_file_path_and_line(start_line, end_line)
  local filepath = vim.fn.expand('%:p')

  -- Check if we have a valid file
  if filepath == '' then
    print('No file is currently open')
    return
  end

  local result
  if start_line and end_line then
    -- Called from visual mode with range
    if start_line == end_line then
      result = filepath .. ':' .. start_line
    else
      result = filepath .. ':' .. start_line .. '-' .. end_line
    end
  else
    -- Normal mode - just current line
    local line_number = vim.fn.line('.')
    result = filepath .. ':' .. line_number
  end

  vim.fn.setreg('+', result)
  vim.notify('File path and line number copied: ' .. result)
end

-- Set up the global function and keymap
function M.setup()
  -- Make the function globally accessible
  _G.CopyFilePathAndLine = M.copy_file_path_and_line

  -- Set up the keymap for normal mode
  vim.keymap.set('n', '<leader>cl', ':lua CopyFilePathAndLine()<CR>', { noremap = true, silent = true })

  -- Set up the keymap for visual mode - use range and exit visual mode first
  vim.keymap.set('v', '<leader>cl', ':<C-u>lua CopyFilePathAndLine(vim.fn.line("\'<"), vim.fn.line("\'>"))<CR>', { noremap = true, silent = true })
end

return M