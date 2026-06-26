# Autoformat Setup Guide

This configuration provides consistent formatting across Neovim, Claude Code, and git hooks using the same formatter tools.

## What's Configured

### ✅ Neovim (via conform.nvim)
- **Format on save**: Automatic formatting when saving files
- **Manual format**: `<leader>f` or `<leader>cf`
- **Formatter info**: `<leader>ci` to see active formatters

### ✅ Git Hook Enforcement
- **Pre-commit hook**: Automatically formats and checks staged files
- **Prevents commits**: If formatting changes files, commit is blocked until reviewed

### ✅ Claude Code Alignment
The formatters configured match Claude Code's internal formatting tools:

| Language | Formatter | Settings |
|----------|-----------|----------|
| JavaScript/TypeScript | prettier | 2 spaces, single quotes off, trailing commas |
| Python | black + isort | 100 char line length, skip string normalization |
| Go | gofmt + goimports | Standard Go formatting |
| Ruby | rubocop | Auto-correct enabled |
| Lua | stylua | 2 spaces, double quotes preferred |
| Shell | shfmt | 2 space indent, compact if |
| Rust | rustfmt | Default rust formatting |
| HTML/CSS/JSON/YAML | prettier | Consistent web formatting |

## Usage

### In Neovim
```
<leader>f    - Format current buffer
<leader>cf   - Format file or selection (visual mode)
<leader>ci   - Show formatter info
```

### Manual Command Line (same as git hook)
```bash
# Format specific files
prettier --write file.js --tab-width 2 --single-quote false
black --line-length 100 file.py
gofmt -s -w file.go
```

### Installing Formatters
Formatters are auto-installed via Mason when you open Neovim:
- `prettier`, `black`, `isort`, `gofmt`, `goimports`, `rustfmt`
- `stylua`, `shfmt`, `rubocop`, `sql-formatter`, `xmlformatter`

## Git Hook Details

**Location**: `.git/hooks/pre-commit`
**Behavior**:
- Runs formatters on staged files
- If files are reformatted, they're re-staged and commit is blocked
- Shows clear feedback about what was formatted
- You review changes and commit again

**Disable temporarily**: `git commit --no-verify`

## Claude Code Compatibility

✅ **Same formatters**: Both use prettier, black, gofmt, etc.
✅ **Same settings**: Matching configuration (line length, quotes, etc.)
✅ **Same rules**: Enforcement via git hooks prevents divergence

When Claude Code formats code, it will match your Neovim formatting exactly.

## Troubleshooting

**Formatter not found**: Run `:Mason` in Neovim to install missing tools
**Git hook failing**: Check that formatters are installed globally or via Mason
**Format on save not working**: Verify conform.nvim is loaded (`:ConformInfo`)

## Key Files

- `lua/plugins.lua` - Added conform.nvim plugin
- `lua/formatter-config.lua` - Formatter configurations
- `lua/lsp.lua` - Updated to use conform instead of LSP formatting
- `.git/hooks/pre-commit` - Git hook enforcement