-- Language server configuration

-- Enable lsp configuration when lsp attaches to a buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('maxcaplan-lsp-attach', { clear = true }),
	callback = function(event)
		local lsp_client = vim.lsp.get_client_by_id(event.data.client_id)

		--- vim keymap helper function for setting lsp keymaps
		local set_lsp_keymap = function(keys, func, desc, mode)
			vim.keymap.set(mode or 'n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
		end

		-- Go to decleration
		set_lsp_keymap('grD', vim.lsp.buf.declaration, '[G]o to [D]eclaration')
		-- Execute a code action
		set_lsp_keymap('gra', vim.lsp.buf.code_action, '[G]o to Code [A]ction')
		-- Rename variable under cursor
		set_lsp_keymap('grn', vim.lsp.buf.rename, '[R]e[n]ame Variable')

		-- Toggle code inlay hints if supported by lsp
		if lsp_client and lsp_client:supports_method('textDocument/inlayHint', event.buf) then
			set_lsp_keymap('<leader>th', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled( { bufnr = event.buf } )) end, '[T]oggle Inlay [H]ints')
		end

		-- Enable highlighting references to the word under the cursor if supported by lsp
		if lsp_client and lsp_client:supports_method('textDocument/documentHighlight') then
			local highlight_augroup = vim.api.nvim_create_augroup('maxcaplan-lsp-highlight', { clear = false })

			vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})
		end
	end,
})

-- Cleanup lsp configuration when lsp detaches from a buffer
vim.api.nvim_create_autocmd('LspDetach', {
	group = vim.api.nvim_create_augroup('maxcaplan-lsp-detach', { clear = true }),
	callback = function(event)
		local lsp_client = vim.lsp.get_client_by_id(event.data.client_id)

		if lsp_client and lsp_client:supports_method('textDocument/documentHighlight') then
			vim.lsp.buf.clear_references()
			vim.api.nvim_clear_autocmds({ group = 'maxcaplan-lsp-highlight', buffer = event.buf })
		end
	end,
})

-- Install the following servers by default
---@type table<string, vim.lsp.Config>
local lsp_server_configs = {
	-- Lua formatter
	stylua = {},
}

-- Get lsp configs folder
local lsp_configs_dir_path = vim.fn.stdpath("config") .. "/lua/lsp/configs"

-- Get lsp configurations from files
if vim.fn.isdirectory(lsp_configs_dir_path) then
	for _, file in ipairs(vim.fn.readdir(lsp_configs_dir_path)) do
		if file:match("%.lua$") and file ~= "init.lua" then
			local server_name = vim.fn.fnamemodify(file, ':t:r')
			local status, result = pcall(loadfile(lsp_configs_dir_path .. '/' .. file))

			if status then
				lsp_server_configs[server_name] = result
			else
				vim.notify(tostring(err), vim.log.levels.ERROR)
			end
		end
	end
end

local ensure_installed_servers = vim.tbl_keys(lsp_server_configs or {})

-- Add LSP setup plugins
vim.pack.add {
	-- Quickstart LSP configs
	'https://github.com/neovim/nvim-lspconfig',
	-- LSP server package manager
	'https://github.com/mason-org/mason.nvim',
	-- Mason lspconfig intigration
	'https://github.com/mason-org/mason-lspconfig.nvim',
}

-- Setup mason
require('mason').setup()
require('mason-lspconfig').setup(
	{ ensure_installed = ensure_installed_servers }
)

-- Enable and configure lsp servers
for server_name, server_config in pairs(lsp_server_configs) do
	vim.lsp.config(server_name, server_config)
	vim.lsp.enable(server_name)
end
