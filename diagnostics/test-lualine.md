# Lualine Testing Guide

## What You Should See

Your status line should now display modern, colorful information with icons:

### Left Side
1. **Mode indicator** with icon (e.g., ` NORMAL`, ` INSERT`)
2. **Git branch** with  icon
3. **Git diff** indicators: ` +2 ~1 -1` (added/modified/removed lines)
4. **Filename** with modification status `[+]` or readonly `[-]`
5. **LSP diagnostics** with icons:  ` 2 ⚠ 1 ℹ 3` (errors/warnings/info)

### Right Side
1. **LSP servers** active in buffer (e.g., ` ts_ls, solargraph`)
2. **File encoding** (e.g., `utf-8`)
3. **File format** (e.g., `unix`)
4. **File type** (e.g., `typescript`)
5. **Progress** percentage through file
6. **Cursor location** (line:column)

## Expected Improvements over Lightline

**Visual:**
- ✅ **Modern icons** using Nerd Font glyphs
- ✅ **Better colors** that auto-adapt to your colorscheme
- ✅ **Cleaner separators** with rounded corners
- ✅ **Consistent theming** across different colorschemes

**Functionality:**
- ✅ **Native LSP integration** - shows active language servers
- ✅ **Real-time diagnostics** - updates as you type
- ✅ **Git diff indicators** - see changes at a glance
- ✅ **Better performance** - Lua-based, faster rendering
- ✅ **Dynamic updates** - responds to LSP attach/detach

## Testing Different Modes

Open a file and test different modes to see mode indicators:

1. **Normal mode**: ` NORMAL` (blue/green)
2. **Insert mode**: ` INSERT` (red/orange) - press `i`
3. **Visual mode**: ` VISUAL` (purple/yellow) - press `v`
4. **Command mode**: ` COMMAND` - press `:`

## LSP Integration Testing

1. **Open TypeScript file**: Should show ` ts_ls` on right side
2. **Open Ruby file**: Should show ` solargraph` 
3. **Create syntax error**: Should show ` 1` (error count)
4. **Fix error**: Error count should disappear

## Git Integration Testing

In a git repository:
1. **Make changes**: Should show ` branch-name`
2. **Add/modify lines**: Should show ` +3 ~1` indicators
3. **Stage changes**: Git diff should update
4. **Switch branches**: Branch name should change

## Extensions

Lualine includes extensions for:
- **Fugitive** - Git commands
- **Telescope** - When picker is open
- **Mason** - When managing LSP servers
- **Lazy** - When managing plugins
- **nvim-tree** - File explorer (if you add it later)

## Troubleshooting

**No icons showing?**
- Install a Nerd Font: https://www.nerdfonts.com/
- Set terminal to use the Nerd Font
- Common fonts: `FiraCode Nerd Font`, `JetBrains Mono Nerd Font`

**Colors look wrong?**
- Lualine auto-detects your colorscheme
- Try `:colorscheme onedark` or `:colorscheme iceberg`
- Check `:set termguicolors` is enabled

**LSP info not showing?**
- Verify LSP is attached: `:LspInfo`
- Check diagnostics exist: `:lua vim.diagnostic.get()`

**Git info missing?**
- Ensure you're in a git repository
- Check fugitive is loaded: `:FugitiveHead`

## Customization

The lualine config supports:
- **Custom themes** - matches your colorscheme automatically
- **Component customization** - modify what's shown where
- **Extension integration** - works with all modern plugins
- **Performance optimization** - only updates when needed

## Performance Comparison

**Before (Lightline):**
- VimScript-based rendering
- Manual refresh triggers
- Limited LSP integration

**After (Lualine):**
- Lua-based (faster execution)
- Auto-refresh on LSP/diagnostic changes
- Native integration with modern plugins
- Better resource management