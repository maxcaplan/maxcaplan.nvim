-- Enable Lua module caching
vim.loader.enable()

-- Base editor settings
require('settings')
-- Package manager configuration
require('pack')
-- LSP configuration
require('lsp')
