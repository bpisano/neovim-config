local status, chatgpt = pcall(require, "chatgpt")
if not status then
	return
end

chatgpt.setup({
	chat = {
		keymaps = {
			close = { "<C-q>" },
			selected_session = { "<CR>" },
		},
	},
})
