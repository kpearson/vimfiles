-- LSP Configuration
local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- Enable completion capabilities
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Common on_attach function
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Buffer local mappings
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  
  -- LSP keybindings
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)

  -- Highlight symbol under cursor
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    vim.api.nvim_create_autocmd("CursorHold", {
      group = "lsp_document_highlight",
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      group = "lsp_document_highlight", 
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

-- Setup Mason first
require('mason').setup({
  ui = {
    border = 'rounded',
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- Setup mason-lspconfig
require('mason-lspconfig').setup({
  ensure_installed = {
    'ts_ls',              -- TypeScript/JavaScript (formerly tsserver)
    'solargraph',         -- Ruby
    'gopls',              -- Go
    'html',               -- HTML
    'cssls',              -- CSS
    'jsonls',             -- JSON
    'yamlls',             -- YAML
    'bashls',             -- Bash
    'dockerls',           -- Docker
    'graphql',            -- GraphQL
  },
  automatic_installation = true,
})

-- Language Server Configurations
local servers = {
  -- TypeScript/JavaScript
  ts_ls = {
    init_options = {
      preferences = {
        disableSuggestions = false,
      }
    },
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        }
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        }
      }
    }
  },

  -- Ruby
  solargraph = {
    settings = {
      solargraph = {
        diagnostics = true,
        completion = true,
        hover = true,
        formatting = true,
        symbols = true,
        definitions = true,
        rename = true,
        references = true,
        folding = true,
      }
    }
  },

  -- Go
  gopls = {
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
        gofumpt = true,
      },
    },
  },

  -- HTML
  html = {
    settings = {
      html = {
        format = {
          templating = true,
          wrapLineLength = 120,
          wrapAttributes = 'auto',
        },
        hover = {
          documentation = true,
          references = true,
        },
      }
    }
  },

  -- CSS
  cssls = {
    settings = {
      css = {
        validate = true,
        lint = {
          unknownAtRules = "ignore"
        }
      },
      scss = {
        validate = true,
        lint = {
          unknownAtRules = "ignore"
        }
      },
      less = {
        validate = true,
        lint = {
          unknownAtRules = "ignore"
        }
      }
    }
  },

  -- JSON
  jsonls = {
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
        validate = { enable = true },
      }
    }
  },

  -- YAML
  yamlls = {
    settings = {
      yaml = {
        keyOrdering = false,
        format = {
          enable = true,
        },
        validate = true,
        schemaStore = {
          enable = false,
          url = "",
        },
        schemas = require('schemastore').yaml.schemas(),
      }
    }
  },

  -- Bash
  bashls = {},

  -- Docker
  dockerls = {},

  -- GraphQL
  graphql = {
    filetypes = { "graphql", "gql", "svelte", "astro", "vue" },
  },
}

-- Setup language servers
for server, config in pairs(servers) do
  local server_config = vim.tbl_deep_extend("force", {
    on_attach = on_attach,
    capabilities = capabilities,
  }, config)
  
  lspconfig[server].setup(server_config)
end

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
    source = "if_many",
  },
  float = {
    source = "if_many",
    border = 'rounded',
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

return {
  on_attach = on_attach,
  capabilities = capabilities,
}