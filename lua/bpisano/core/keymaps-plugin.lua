local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- nvim-comment
function toggle_comment()
  vim.api.nvim_command([[exec "'<,'>CommentToggle"]])
end

keymap("n", "<C-/>", ":CommentToggle<CR>", opts)
keymap("i", "<C-/>", ":CommentToggle<CR>", opts)
keymap("v", "<C-/>", ":lua toggle_comment()<CR>", opts)

-- nvim-tree
keymap("n", "<leader>e", ":NvimTreeFocus<CR>", opts)
keymap("n", "<leader>E", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fw", ":Telescope live_grep<CR>", opts)
