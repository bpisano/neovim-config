local status, illuminate = pcall(require, "illuminate")
if not status then
	return
end

illuminate.configure({
	providers = {
		"lsp",
		"treesitter",
		"regex",
	},
	filetypes_denylist = { "NvimTree" },
	delay = 100,
	min_count_to_highlight = 2,
})
