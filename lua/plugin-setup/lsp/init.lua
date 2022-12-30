local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "plugin-setup.lsp.mason"
require("plugin-setup.lsp.handlers").setup()
require "plugin-setup.lsp.null-ls"
