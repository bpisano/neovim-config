local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-/>", ":CommentToggle<CR>", opts)
keymap("i", "<C-/>", ":CommentToggle<CR>", opts)
keymap("v", "<C-/>", ":'<,'>CommentToggle<CR>", opts)

-- nvim-tree
keymap("n", "<leader>e", ":NvimTreeFocus<CR>", opts)
keymap("n", "<leader>E", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>fe", ":NvimTreeFindFile<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fw", ":Telescope live_grep<CR>", opts)
