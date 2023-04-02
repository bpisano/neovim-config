local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- Space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows
keymap("n", "<A-Down>", ":resize -2<CR>", opts)
keymap("n", "<A-Up>", ":resize +2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Better indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move selected line / block of text in visual mode
keymap("v", "∆", ":'<,'>m '>+1<CR>==gv", opts)
keymap("v", "˚", ":'<,'>m '<-2<CR>==gv", opts)
keymap("v", "p", '"_dP', opts)

-- Telescope
keymap(
	"n",
	"<leader>ff",
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
	opts
)
vim.keymap.set("n", "fg", "<cmd>Telescope live_grep<cr>", {})

vim.keymap.set("n", "<C-t>", vim.cmd.ToggleTerm)

vim.api.nvim_set_keymap("n", "<C-s>", ":noh<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ef", ":EslintFixAll<CR>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function()
		vim.lsp.buf.format()
	end,
})
