local servers = {
    "csharp_ls",
    "omnisharp_mono",
    "omnisharp",
    "cssls",
    "cssmodules_ls",
    "unocss",
    "eslint",
    "jsonls",
    "quick_lint_js",
    "tsserver",
    "vtsls",
    "marksman",
    "prosemd_lsp",
    "remark_ls",
    "zk",
    "prismals",
    "tailwindcss",
    "tsserver",
    "vtsls",
    "yamlls",
}

local settings = {
    ui = {
        border = "rounded",
        icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = require("bpisano.lsp.handlers").on_attach,
        capabilities = require("bpisano.lsp.handlers").capabilities,
    }

    server = vim.split(server, "@")[1]

    local require_ok, conf_opts = pcall(require, "bpisano.lsp.settings" .. server)
    if require_ok then
        opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end

    lspconfig[server].setup(opts)
end
