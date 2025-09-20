#!/bin/bash

# Neovim LSP Diagnostics Script
# Comprehensive testing of the modernized setup

echo "🔍 Neovim LSP Diagnostics"
echo "========================="
echo

# Check Neovim version
echo "📋 System Information"
echo "---------------------"
echo "Neovim version: $(nvim --version | head -1)"
echo "Platform: $(uname -s) $(uname -m)"
echo

# Check lazy.nvim status
echo "📦 Plugin Manager Status"
echo "------------------------"
nvim --headless -c "lua print('Lazy.nvim: ' .. (pcall(require, 'lazy') and 'Loaded' or 'Not found'))" -c "qa" 2>/dev/null

# Check LSP availability
echo
echo "🔧 LSP Server Status"
echo "--------------------"
nvim --headless -c "lua local servers = require('lspconfig.util').available_servers(); print('Available servers: ' .. #servers); for _, server in ipairs(servers) do print('  - ' .. server) end" -c "qa" 2>/dev/null

# Test plugin loading
echo
echo "🚀 Plugin Loading Test"
echo "----------------------"
nvim --headless -c "lua local ok, lsp = pcall(require, 'lspconfig'); print('LSP Config: ' .. (ok and 'OK' or 'FAIL'))" -c "qa" 2>/dev/null
nvim --headless -c "lua local ok, cmp = pcall(require, 'cmp'); print('Completion: ' .. (ok and 'OK' or 'FAIL'))" -c "qa" 2>/dev/null
nvim --headless -c "lua local ok, mason = pcall(require, 'mason'); print('Mason: ' .. (ok and 'OK' or 'FAIL'))" -c "qa" 2>/dev/null
nvim --headless -c "lua local ok, luasnip = pcall(require, 'luasnip'); print('LuaSnip: ' .. (ok and 'OK' or 'FAIL'))" -c "qa" 2>/dev/null

# Performance test
echo
echo "⚡ Performance Test"
echo "------------------"
echo "Measuring startup time..."
nvim --headless --startuptime /tmp/nvim_startup.log -c "qa" 2>/dev/null
if [ -f /tmp/nvim_startup.log ]; then
    startup_time=$(tail -1 /tmp/nvim_startup.log | awk '{print $1}')
    echo "Startup time: ${startup_time}ms"
    if (( $(echo "$startup_time < 500" | bc -l) )); then
        echo "✅ Excellent startup time!"
    elif (( $(echo "$startup_time < 1000" | bc -l) )); then
        echo "✅ Good startup time"
    else
        echo "⚠️  Slower than expected (>1000ms)"
    fi
    rm /tmp/nvim_startup.log
fi

# Test file diagnostics
echo
echo "📝 Test File Diagnostics"
echo "------------------------"
test_files=("test.ts" "test.rb" "test.go" "test.js" "test.json" "test.yaml")
for file in "${test_files[@]}"; do
    if [ -f "diagnostics/$file" ]; then
        echo "✅ $file exists"
    else
        echo "❌ $file missing"
    fi
done

echo
echo "🎯 Manual Testing"
echo "-----------------"
echo "1. Open test files: nvim diagnostics/test.ts"
echo "2. Check LSP status: :LspInfo"
echo "3. Open Mason: :Mason"
echo "4. Test completion: Ctrl+Space while typing"
echo "5. Test hover: K over a symbol"
echo "6. Test go-to-definition: gd on a symbol"
echo
echo "For detailed testing instructions, see diagnostics/README.md"