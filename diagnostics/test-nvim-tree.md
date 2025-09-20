# Nvim-tree Testing Guide

## What You Should See

A modern file explorer that replaces CoC's file explorer functionality.

### Key Features
- **File tree sidebar** with icons and git status
- **LSP diagnostics** shown directly in the tree
- **Git integration** with file status indicators
- **Smart navigation** with vim-like keybindings

## Basic Usage

### Opening/Closing
- `Ctrl+n` - Toggle file tree on/off
- `<leader>e` - Focus on file tree
- `<leader>tt` - Toggle file tree (alternative)
- `<leader>tf` - Find current file in tree
- `<leader>tc` - Collapse all folders

### Navigation (Inside Tree)
- `j/k` - Move up/down
- `l` - Open file/expand folder
- `h` - Close folder/go to parent
- `Enter` - Open file
- `v` - Open in vertical split
- `s` - Open in horizontal split
- `t` - Open in new tab

### File Operations
- `a` - Create new file/folder (add `/` for folder)
- `d` - Delete file/folder
- `r` - Rename file/folder
- `x` - Cut file/folder
- `c` - Copy file/folder
- `p` - Paste file/folder
- `y` - Copy filename
- `Y` - Copy relative path

## Visual Indicators

### File Icons
- 📁 **Folders** with expand/collapse arrows
- 📄 **Files** with type-specific icons
- 🔗 **Symlinks** with arrow indicator

### Git Status
- ✓ **Staged** files (green checkmark)
- ✗ **Modified** files (red X)
- ★ **Untracked** files (yellow star)
- ➜ **Renamed** files (blue arrow)
- 🗑 **Deleted** files (trash icon)

### LSP Diagnostics
- 🔴 **Errors** - red dot next to files with errors
- 🟡 **Warnings** - yellow triangle for warnings
- 🔵 **Info** - blue circle for info messages
- 💡 **Hints** - lightbulb for hints

## Expected Improvements over CoC Explorer

**Performance:**
- ✅ **Faster startup** - No Node.js dependency
- ✅ **Better responsiveness** - Native Lua implementation
- ✅ **Live updates** - Auto-refresh on file changes

**Features:**
- ✅ **Git integration** - See file status at a glance
- ✅ **LSP diagnostics** - Errors/warnings in tree
- ✅ **Better icons** - Nerd Font support
- ✅ **Smart filters** - Hide node_modules, .git automatically
- ✅ **Window management** - Better split handling

**Usability:**
- ✅ **Vim-like navigation** - h/j/k/l movement
- ✅ **Consistent keybindings** - Logical key mappings
- ✅ **Context awareness** - Highlights current file
- ✅ **Auto-close** - Closes when last window

## Testing Scenarios

### 1. Basic File Operations
```bash
# Open nvim and test basic operations
nvim .
# Press Ctrl+n to open tree
# Navigate to a file and press 'l' to open
# Try creating a new file with 'a'
```

### 2. Git Integration
```bash
# In a git repository
git status
# Open nvim-tree (Ctrl+n)
# Modify a file and save
# Tree should show modified status (✗)
```

### 3. LSP Diagnostics
```bash
# Open a file with syntax errors
nvim test.ts
# Tree should show error indicator on file
# Fix error, tree should update automatically
```

### 4. Multi-window Workflow
```bash
# Open multiple files in splits
nvim file1.js file2.js
# Use 'v' and 's' in tree to open in splits
# Test window navigation
```

## Customization

The nvim-tree config includes:
- **Custom icons** for better visual clarity
- **Smart filtering** to hide unnecessary files
- **Git integration** for repository awareness
- **LSP diagnostics** for code quality overview
- **Window management** for split-friendly workflow

## Troubleshooting

**Tree not showing icons?**
- Install a Nerd Font: https://www.nerdfonts.com/
- Ensure `nvim-web-devicons` is installed

**Git status not updating?**
- Ensure you're in a git repository
- Try `:NvimTreeRefresh` to force update

**LSP diagnostics missing?**
- Verify LSP is running: `:LspInfo`
- Check diagnostics exist: `:lua vim.diagnostic.get()`

**Performance issues?**
- Increase filesystem watcher debounce in config
- Consider excluding large directories

## Keybinding Cheat Sheet

| Key | Action | Context |
|-----|--------|---------|
| `Ctrl+n` | Toggle tree | Global |
| `<leader>e` | Focus tree | Global |
| `l` | Open/expand | In tree |
| `h` | Close/parent | In tree |
| `a` | Create file | In tree |
| `d` | Delete | In tree |
| `r` | Rename | In tree |
| `v` | Vertical split | In tree |
| `s` | Horizontal split | In tree |
| `?` | Help | In tree |