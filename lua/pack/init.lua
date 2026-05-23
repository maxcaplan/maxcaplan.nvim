-- Neovim package manager configuration

---Run a build command for a package
---@param package_name string Name of the package
---@param build_command string[] Build command to run
---@param build_directory string Directory to run the build command in
local function run_package_build(package_name, build_command, build_directory)
	local result = vim.system(build_command, { cwd = build_directory }):wait()

	-- Log error if build command failed
	if result.code ~= 0 then
		local output = result.stderr or result.stdout
		if not output or output == '' then
			output = 'No output from build command'
		end
		vim.notify(('Build failed for %s:\n%s'):format(package_name, output), vim.log.levels.ERROR)
	end
end

-- Handle package installed or updated event
vim.api.nvim_create_autocmd('PackChanged', {
	callback = function (event)
		local package_name = event.data.spec.name
		local package_kind = event.data.kind

		if package_kind ~= 'install' and package_kind ~= 'update' then
			return
		end

		if package_name == 'nvim-treesitter' then
			-- Update treesitter parsers
			vim.cmd('TSUpdate')
		end

		if package_name == 'telescope-fzf-native.nvim' then
			-- Build fzf native
			if vim.fn.executable('make') then
				run_package_build(package_name, { 'make' }, event.data.path)
			end
			return
		end

		if package_name == 'LuaSnip' then
			-- Install jsregexp
			if vim.fn.has('win32') ~= 1 and vim.fn.executable('make') then
				run_package_build(package_name, { 'make', 'install_jsregexp' }, event.data.path)
			end
			return
		end
	end
})
