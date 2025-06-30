# Gitsigns Testing Guide

## What You Should See

Modern git integration showing changes in the sign column (left gutter) with better performance than vim-signify.

### Visual Indicators

**Sign Column Icons:**
- `+` **Added lines** (green)
- `~` **Modified lines** (yellow/orange)  
- `_` **Deleted lines** (red)
- `‾` **Top deleted lines** (red)
- `┆` **Untracked lines** (gray)

**Staged vs Unstaged:**
- Gitsigns shows both staged and unstaged changes
- Different highlighting for staged changes

## Expected Improvements over vim-signify

**Performance:**
- ✅ **Faster updates** - Lua-based, more responsive
- ✅ **Better debouncing** - Smoother experience while typing
- ✅ **Async operations** - Doesn't block editor
- ✅ **Smart caching** - Only updates when necessary

**Features:**
- ✅ **Hunk navigation** - Jump between changes
- ✅ **Staging from editor** - Stage hunks without command line
- ✅ **Inline blame** - See git blame inline
- ✅ **Hunk preview** - Preview changes in popup
- ✅ **Text objects** - `ih` to select hunk
- ✅ **Better integration** - Works with lualine automatically

## Keybindings

### Navigation
- `]c` - Next hunk (git change)
- `[c` - Previous hunk (git change)

### Hunk Actions
- `<leader>hs` - Stage hunk under cursor
- `<leader>hr` - Reset hunk under cursor
- `<leader>hp` - Preview hunk in popup
- `<leader>hu` - Undo stage hunk
- `<leader>hS` - Stage entire buffer
- `<leader>hR` - Reset entire buffer

### Git Information
- `<leader>hb` - Show git blame for current line
- `<leader>hd` - Diff current file
- `<leader>hD` - Diff against HEAD~1

### Toggles
- `<leader>tb` - Toggle line blame display
- `<leader>td` - Toggle deleted lines display

### Text Objects
- `ih` - Select current hunk (works with `dih`, `vih`, etc.)

## Testing Scenarios

### 1. Basic Change Detection
```bash
# Make some changes to a tracked file
echo "console.log('test')" >> test.js
# Should see '+' in sign column next to new line
```

### 2. Hunk Navigation
```bash
# Make changes in multiple places
# Use ]c and [c to jump between changes
# Should highlight current hunk
```

### 3. Staging from Editor
```bash
# Position cursor on a changed line
# Press <leader>hs to stage the hunk
# Sign should change to show staged state
```

### 4. Hunk Preview
```bash
# Position cursor on changed line
# Press <leader>hp to see diff in popup
# Should show before/after comparison
```

### 5. Line Blame
```bash
# Open a file with git history
# Press <leader>hb on any line
# Should show commit info, author, date
```

## Visual Integration

### With Lualine
Gitsigns integrates automatically with lualine to show:
- **Git branch** in status line
- **Change counts** (`+3 ~1 -2`) 
- **Real-time updates** as you edit

### With nvim-tree
- File tree shows git status automatically
- Modified files marked with appropriate icons
- Untracked files highlighted differently

## Commands

```vim
:Gitsigns toggle_signs          " Toggle sign column
:Gitsigns toggle_current_line_blame  " Toggle inline blame
:Gitsigns blame_line           " Show blame popup
:Gitsigns preview_hunk         " Preview current hunk
:Gitsigns diffthis             " Diff current file
:Gitsigns stage_buffer         " Stage all changes
:Gitsigns reset_buffer         " Reset all changes
```

## Performance Comparison

**Before (vim-signify):**
- VimScript-based updates
- Slower git status checks
- Less responsive to rapid changes
- Basic hunk navigation

**After (gitsigns.nvim):**
- Lua-based (faster execution)
- Async git operations
- Debounced updates (smoother)
- Rich feature set (staging, blame, preview)
- Better text objects
- Lualine integration

## Advanced Features

### Inline Blame
```vim
" Toggle to see commit info next to each line
:Gitsigns toggle_current_line_blame
```

### Word-level Diff
```vim
" See changes within lines highlighted
:Gitsigns toggle_word_diff
```

### Staging Workflow
```bash
# Stage individual hunks
<leader>hs   # Stage current hunk
<leader>hS   # Stage entire file
<leader>hu   # Undo staging

# Then commit as usual
:!git commit -m "message"
```

## Troubleshooting

**No signs showing?**
- Ensure you're in a git repository: `git status`
- Check if signs are enabled: `:Gitsigns toggle_signs`
- Verify signcolumn is visible: `:set signcolumn=yes`

**Performance issues?**
- Large files automatically disabled (40k+ lines)
- Adjust debounce: `:lua require('gitsigns').setup({update_debounce = 200})`

**Colors wrong?**
- Gitsigns uses DiffAdd, DiffChange, DiffDelete highlight groups
- Customize: `:highlight GitSignsAdd guifg=#00ff00`

**Keybindings not working?**
- Gitsigns only attaches to git-tracked files
- Check attachment: `:Gitsigns attach`

## Customization

The gitsigns config supports:
- **Custom sign symbols** - Change +, ~, _ symbols
- **Different colors** - Match your colorscheme
- **Blame formatting** - Customize blame line format
- **Preview styling** - Popup window appearance
- **Performance tuning** - Debounce, file size limits