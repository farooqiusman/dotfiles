-- Native LSP Setup
local on_attach = function(client, bufnr)
	local opts = { noremap = true, buffer = bufnr }
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "<Leader>dj", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<Leader>dk", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "<Leader>dl", "<cmd>Telescope diagnostics<cr>", opts)
	vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, opts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
	-- Formatting
	vim.keymap.set("n", "<Leader>l", function() vim.lsp.buf.format { async = false } end, { noremap = true })
	vim.keymap.set("x", "<Leader>l", vim.lsp.buf.format, { noremap = true })
end

local lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- List of language servers to apply the default configuration to
local servers = { 'pyright', 'vimls', 'ccls', 'jdtls', 'jsonls', 'gopls', 'texlab' }
for _, server in pairs(servers) do
	lsp[server].setup {
		capabilities = capabilities,
		on_attach = on_attach,
	}
end

-------------------------------------------------
-- SPECIALIZED CONFIGURATION FOR LANGUAGE SERVERS
-------------------------------------------------

lsp.tailwindcss.setup {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		vim.pretty_print(lsp.util)
		on_attach(client, bufnr)
	end,
	root_dir = lsp.util.find_git_ancestor
}

lsp.tsserver.setup {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		-- Disable tsserver formatting so prettier can be used
		client.server_capabilities.documentFormattingProvider = false
		on_attach(client, bufnr)
	end,
}

lsp.lua_ls.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
}

lsp.html.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { 'html', 'xml', 'xhtml' }
}

