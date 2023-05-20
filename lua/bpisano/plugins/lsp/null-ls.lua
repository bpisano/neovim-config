local null_ls_status, null_ls = pcall(require, "null-ls")
if not null_ls_status then
	return
end

local typescript_sources_status, typescript_code_actions = pcall(require, "typescript.extensions.null-ls.code-actions")
if not typescript_sources_status then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		formatting.stylua,
		formatting.eslint_d,
		formatting.prettierd,
		formatting.csharpier,
		diagnostics.eslint.with({ -- js/ts linter
			-- only enable eslint if root has .eslintrc.js
			condition = function(utils)
				return utils.root_has_file(".eslintrc.js")
			end,
		}),
		code_actions.eslint_d,
		typescript_code_actions,
	},
	on_attach = function(current_client, bufnr)
		-- format on save
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			-- vim.api.nvim_create_autocmd("BufWritePre", {
			-- 	group = augroup,
			-- 	pattern = "*.tsx,*.ts,*.jsx,*.js",
			-- 	callback = function()
			-- 		if vim.fn.exists(":TypescriptFixAll") then
			-- 			vim.cmd("TypescriptAddMissingImports!")
			-- 			vim.cmd("TypescriptRemoveUnused!")
			-- 			vim.cmd("TypescriptOrganizeImports!")
			-- 		end
			-- 	end,
			-- })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					if vim.bo.filetype == "typescript" or vim.bo.filetype == "typescriptreact" then
						vim.cmd("TypescriptAddMissingImports!")
						vim.cmd("TypescriptRemoveUnused!")
						vim.cmd("TypescriptOrganizeImports!")
					end
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
