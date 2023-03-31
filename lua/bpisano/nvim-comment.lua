function toggle_comment()
  vim.api.nvim_command([[exec "'<,'>CommentToggle"]])
end

vim.keymap.set("n", "<C-/>", vim.cmd.CommentToggle)
vim.keymap.set("i", "<C-/>", vim.cmd.CommentToggle)
vim.api.nvim_set_keymap('v', '<C-/>', ':lua toggle_comment()<CR>', { noremap = true, silent = true })

require('nvim_comment').setup()
