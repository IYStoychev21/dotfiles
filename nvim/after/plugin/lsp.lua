local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"rust_analyzer",
	"clangd",
	"cssls",
	"tailwindcss",
	"volar",
	"dockerls",
	"html",
	"pyre",
})

lsp.setup()

