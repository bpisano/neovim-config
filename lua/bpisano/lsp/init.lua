local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "bpisano.lsp.mason"
require("bpisano.lsp.handlers").setup()
require "bpisano.lsp.null-ls"
