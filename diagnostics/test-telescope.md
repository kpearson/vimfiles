# Telescope Testing Guide

## Quick Test Commands

### Basic Telescope Functions
```vim
:Telescope find_files    " Find files in project
:Telescope live_grep     " Search text in project  
:Telescope buffers       " Switch between open buffers
:Telescope help_tags     " Search help documentation
:Telescope oldfiles      " Recent files
```

### Keybinding Tests

| Key | Command | Expected Result |
|-----|---------|-----------------|
| `Ctrl+P` | Find files | Dropdown with file picker |
| `<leader>ff` | Find files | Same as Ctrl+P |
| `<leader>fg` | Live grep | Search text with live preview |
| `<leader>fb` | Buffers | List open buffers |
| `<leader>fr` | Recent files | List recently opened files |
| `<leader>fc` | Grep word under cursor | Search current word |
| `<leader>/` | Search in buffer | Search within current file |

### LSP Integration Tests
```vim
:Telescope lsp_document_symbols    " Symbols in current file
:Telescope lsp_workspace_symbols   " Symbols in workspace
:Telescope lsp_references          " Find all references
:Telescope diagnostics             " Show all diagnostics
```

### Expected Improvements over CtrlP

**Features:**
- ✅ **Live preview** of files before opening
- ✅ **Fuzzy matching** with better algorithm  
- ✅ **Multi-selection** with Tab
- ✅ **Integrated grep** with live results
- ✅ **LSP integration** for symbols/references
- ✅ **Git integration** (modified files, branches)

**Navigation:**
- `j/k` or `↑/↓` - Move selection
- `Ctrl+j/k` - Move selection (insert mode)
- `Enter` - Open file
- `Ctrl+x` - Open in horizontal split
- `Ctrl+v` - Open in vertical split
- `Ctrl+t` - Open in new tab
- `Tab` - Select multiple files
- `Ctrl+q` - Send to quickfix list

**Performance:**
- Should be noticeably faster than CtrlP
- Real-time search results
- Better handling of large projects

## What You Should See

1. **Dropdown interface** with preview pane
2. **Fuzzy matching** as you type
3. **File previews** on the right side
4. **Live grep results** with context
5. **Clean, modern UI** with icons (if devicons loaded)

## Troubleshooting

**Telescope not found?**
- Check `:Lazy` to see if telescope.nvim installed
- Try `:checkhealth telescope`

**No file previews?**
- Previews show for supported file types
- Binary files won't have previews

**Slow performance?**
- Check if ripgrep (`rg`) is installed: `rg --version`
- Telescope uses ripgrep for fast searching

**Missing keybindings?**
- Verify with `:map <leader>ff`
- Leader key should be Space