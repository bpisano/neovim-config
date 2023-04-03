local status, tokyonight = pcall(require, "tokyonight")
if not status then
  print("Colorscheme not found.")
  return
end

tokyonight.setup({
  style = "night"
})

vim.cmd[[colorscheme tokyonight]]
