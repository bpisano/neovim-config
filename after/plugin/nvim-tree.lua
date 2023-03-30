local function open_nvim_tree()
    require("nvim-tree.api").tree.open()
end

vim.opt.termguicolors = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>t", vim.cmd.NvimTreeFocus)
vim.keymap.set("n", "<leader>T", vim.cmd.NvimTreeToggle)

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    diagnostics = {
        enable = true,
    }
})
