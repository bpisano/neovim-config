local ts_status, typescript = pcall(require, "typescript")
if not ts_status then
	return
end

local lsp_status, lsp_config = pcall(require, "bpisano.plugins.lsp.lspconfig")
if not lsp_status then
	return
end

local server_opts = {
	on_attach = lsp_config.on_attach,
}

local settings_status, settings = pcall(require, "bpisano.plugins.lsp.settings.tsserver")
if settings_status then
	server_opts = vim.tbl_extend("force", settings, server_opts)
end

typescript.setup({
	server = server_opts,
})
