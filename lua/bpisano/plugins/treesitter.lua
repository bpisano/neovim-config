local treesitter_status, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_status then
  return
end

treesitter.setup({
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  ensure_installed = {
    "json",
    "javascript",
    "typescript",
    "tsx",
    "html",
    "css",
    "markdown",
    "lua",
    "bash",
    "vim",
    "yaml",
    "gitignore",
  },
  auto_install = true,
})
