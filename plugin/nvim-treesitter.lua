-- Nvim treesitter configurations and abstraction layer

vim.pack.add({
	{
		src = 'https://github.com/nvim-treesitter/nvim-treesitter',
		version = 'main',
	},
})

-- Ensure the following parsers are installed
require('nvim-treesitter').install({
	'bash',
	'c',
	'diff',
	'html',
	'lua',
	'luadoc',
	'markdown',
	'markdown_inline',
	'query',
	'vim',
	'vimdoc',
})

local available_parsers = require('nvim-treesitter').get_available()

---Try to attach treesitter parser to a buffer
---@param buf integer
---@param language string
local function try_attach_treesitter(buf, language)
	-- Try loading parser for buffers language
	if not vim.treesitter.language.add(language) then
		return
	end

	-- Start treesitter parser for buffer
	vim.treesitter.start(buf, language)

	-- Enable treesitter based indentation if available
	if vim.treesitter.query.get(language, 'indents') ~= nil then
		vim.bo.indentexpr = 'v:lua.require("nvim-treesitter").indentexpr()'
	end
end

-- Auto install and enable treesitter parsers on different filetypes opened
vim.api.nvim_create_autocmd('FileType', {
	callback = function(args)
		local language = vim.treesitter.language.get_lang(args.match)

		if not language then
			return
		end

		local installed_parsers = require('nvim-treesitter').get_installed('parsers')

		if vim.tbl_contains(installed_parsers, language) then
			-- Attach parser if installed
			try_attach_treesitter(args.buf, language)
		elseif vim.tbl_contains(available_parsers, language) then
			-- Install and attach parser if available
			require('nvim-treesitter').install(language):await(function()
				try_attach_treesitter(args.buf, language)
			end)
		else
			-- Try attaching incase parser exists but is not listed as available
			try_attach_treesitter(args.buf, language)
		end
	end,
})
