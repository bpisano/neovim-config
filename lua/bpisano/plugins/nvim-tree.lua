local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	return
end

local function open_nvim_tree()
	require("nvim-tree.api").tree.open()
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Show explorer on start
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

nvim_tree.setup({
	sort_by = "case_sensitive",
	filters = {
		dotfiles = false,
		custom = {
			"*.meta",
			"*.csproj",
		},
	},
	git = {
		ignore = false,
	},
	renderer = {
		highlight_opened_files = "name",
		group_empty = false,
		indent_markers = {
			enable = true,
			inline_arrows = false,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
		icons = {
			git_placement = "after",
		},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	view = {
		width = 42,
		number = true,
		relativenumber = true,
	},
})
