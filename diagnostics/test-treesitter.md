# Tree-sitter Testing Guide

## Quick Test Commands

### Basic Tree-sitter Status
```vim
:TSInstallInfo           " Show installed parsers
:checkhealth treesitter  " Tree-sitter health check
:TSUpdate               " Update all parsers
:TSInstall typescript   " Install specific parser
```

### Expected Improvements over vim-polyglot

**Performance:**
- ✅ **Incremental parsing** - only re-parse changed areas
- ✅ **Faster highlighting** - especially for large files
- ✅ **Better accuracy** - context-aware parsing
- ✅ **Reduced startup time** - no loading huge syntax files

**Features:**
- ✅ **Smart text objects** - `af` (around function), `if` (inside function)
- ✅ **Context display** - see current function at top of screen
- ✅ **Tree-aware folding** - fold based on syntax structure
- ✅ **Incremental selection** - expand selection by syntax nodes

## Text Objects Testing

Open a code file and test these text objects:

### Function Objects
- `vaf` - Select around function (including definition)
- `vif` - Select inside function (just body)
- `daf` - Delete entire function
- `yif` - Yank function body

### Class Objects  
- `vac` - Select around class
- `vic` - Select inside class
- `dac` - Delete entire class

### Parameter Objects
- `vaa` - Select around parameter
- `via` - Select inside parameter
- `cia` - Change parameter

### Navigation
- `]m` - Go to next function start
- `]M` - Go to next function end
- `[m` - Go to previous function start
- `[[` - Go to next class start

## Context Display

**Tree-sitter context** should show:
- Current function name at top of screen
- Indented to show nesting level
- Updates as you move through code

Test in a nested function:
```javascript
class MyClass {
  myMethod() {
    function innerFunction() {
      // Context should show: MyClass > myMethod > innerFunction
    }
  }
}
```

## Incremental Selection

1. Place cursor inside a function
2. Press `gnn` to start selection
3. Press `grn` to expand selection (parameter → function → class)
4. Press `grm` to shrink selection

## Syntax Highlighting Comparison

**Before (vim-polyglot):**
- Static regex-based highlighting
- Can be inaccurate in complex code
- No incremental updates

**After (Tree-sitter):**
- AST-based highlighting
- Context-aware and accurate
- Incremental parsing for performance

## Expected Language Support

Tree-sitter should provide excellent highlighting for:
- ✅ **JavaScript/TypeScript** - JSX, template literals, etc.
- ✅ **Ruby** - String interpolation, method definitions
- ✅ **Go** - Struct definitions, interfaces
- ✅ **HTML/CSS** - Embedded CSS/JS in HTML
- ✅ **JSON/YAML** - Proper key/value highlighting
- ✅ **Markdown** - Code blocks, emphasis

## Troubleshooting

**No highlighting improvements?**
- Check `:TSInstallInfo` - parsers should be installed
- Try `:TSUpdate` to update parsers
- Restart Neovim after installation

**Text objects not working?**
- Verify Tree-sitter textobjects plugin loaded
- Check specific language parser installed
- Test with `:lua vim.treesitter.get_parser():parse()`

**Context not showing?**
- Check if treesitter-context plugin loaded
- Try `:TSContextToggle` to toggle display
- Works best with functions/classes

**Performance worse than expected?**
- Check file size - Tree-sitter disables for large files (>100KB)
- Try `:lua vim.treesitter.stop()` then `:lua vim.treesitter.start()`

## Advanced Features

### Playground (if installed)
```vim
:TSPlaygroundToggle     " Visual AST explorer
:TSHighlightCapturesUnderCursor  " Debug highlighting
```

### Custom Queries
Tree-sitter uses queries for:
- Highlighting (`highlights.scm`)
- Folding (`folds.scm`) 
- Indentation (`indents.scm`)
- Text objects (`textobjects.scm`)

## What You Should Notice

1. **Faster rendering** of syntax highlighting
2. **More accurate highlighting** in complex nested code
3. **Context bar** at top showing current function
4. **Smart text objects** for functions, classes, parameters
5. **Better folding** based on code structure
6. **No more vim-polyglot bloat** - only install what you need