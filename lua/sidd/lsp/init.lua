local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("sidd.lsp.lsp-installer")
require("sidd.lsp.handlers").setup()
