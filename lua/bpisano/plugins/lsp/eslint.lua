local status, eslint = pcall(require, "eslint")
if not status then
	return
end

eslint.setup({
	bin = "eslint_d",
	code_action = {
		enable = true,
	},
	diagnostics = {
		enable = true,
	},
})
