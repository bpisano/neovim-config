local status, lspconfig = pcall(require, "lspconfig")
if not status then
	return
end

local pid = vim.fn.getpid()
local home = os.getenv("HOME")
local omnisharp_bin = home .. "/.cache/omnisharp-vim/omnisharp-roslyn/run"

return {
	cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
	root_dir = lspconfig.util.root_pattern("*.csproj", "*.sln"),
}
