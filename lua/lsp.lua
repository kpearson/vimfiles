-- LSP Configuration - Use modern API for Neovim 0.11+
if vim.fn.has('nvim-0.11') == 1 then
  -- Use modern vim.lsp.config API (Neovim 0.11+)
  return require('lsp-modern')
else
  -- Fallback to legacy lspconfig for older versions
  return require('lsp-legacy')
end