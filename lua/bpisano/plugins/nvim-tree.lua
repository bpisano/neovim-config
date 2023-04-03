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

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  view = {
    width = 42,
    number = true,
    relativenumber = true
  }
})
