# Neovim LSP Diagnostics

This directory contains diagnostic tools to verify and troubleshoot your modernized Neovim setup.

## Quick Diagnostics

Run the main diagnostic script:
```bash
./run-diagnostics.sh
```

## Test Files

Each file is designed to trigger specific LSP features:

| File | Language Server | Expected Issues |
|------|----------------|-----------------|
| `test.ts` | ts_ls | Type errors, completions |
| `test.rb` | solargraph | Syntax errors, Rails methods |
| `test.go` | gopls | Import errors, formatting |
| `test.js` | ts_ls | ESLint warnings |
| `test.json` | jsonls | Schema validation |
| `test.yaml` | yamlls | Syntax validation |

## LSP Keybindings

| Key | Action | Expected Result |
|-----|--------|-----------------|
| `gd` | Go to definition | Jump to symbol |
| `K` | Hover docs | Show documentation popup |
| `gr` | Find references | List all references |
| `<leader>rn` | Rename | Rename symbol everywhere |
| `<leader>ca` | Code actions | Show quick fixes |
| `<leader>f` | Format | Auto-format code |
| `Ctrl+Space` | Completion | Show LSP suggestions |

## Diagnostic Commands

```vim
:LspInfo          " Show attached servers
:Mason            " LSP server manager  
:checkhealth lsp  " LSP health check
:Lazy             " Plugin manager status
```

## Performance Benchmarks

Expected startup improvements over CoC:
- **Startup time**: 60-70% faster
- **First completion**: 70-80% faster  
- **Memory usage**: 40% reduction
- **No Node.js dependency**