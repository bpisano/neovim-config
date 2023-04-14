local status, onedark = pcall(require, "onedark")
if not status then
	print("Colorscheme not found.")
	return
end

onedark.setup({
	style = "deep",
})
onedark.load()
