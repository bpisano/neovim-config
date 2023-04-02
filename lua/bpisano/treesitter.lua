local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = {
		"bash",
		"c",
		"javascript",
		"json",
		"lua",
		"python",
		"typescript",
		"tsx",
		"css",
		"rust",
		"java",
		"yaml",
		"markdown",
		"markdown_inline",
		"vim",
	}, -- one of "all" or a list of languages
	ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true },
	rainbow = {
		enable = true,
		query = "rainbow-parens",
		strategy = require("ts-rainbow").strategy.global,
	},
})
