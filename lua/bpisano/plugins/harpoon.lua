local mark_status, mark = pcall(require, "harpoon.mark")
if not mark_status then
	return
end

local ui_status, ui = pcall(require, "harpoon.ui")
if not ui_status then
	return
end

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)
vim.keymap.set("n", "˙", ui.nav_prev)
vim.keymap.set("n", "¬", ui.nav_next)

vim.keymap.set("n", "<leader>1", function()
	ui.nav_file(1)
end)
vim.keymap.set("n", "<leader>2", function()
	ui.nav_file(2)
end)
vim.keymap.set("n", "<leader>3", function()
	ui.nav_file(3)
end)
vim.keymap.set("n", "<leader>4", function()
	ui.nav_file(4)
end)
