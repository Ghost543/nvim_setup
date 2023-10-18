local lsp = require('lsp-zero')

lsp.preset('recommended')

-- lsp.ensure_installed({
-- 	'tsserver',
--	'eslint',
--	'sumneko_lua',
--	'rust_analyzer',
--	'gopls',
-- })

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
-- local cmp_mappings = lsp.defaults.cmp_mappings({
--	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--	['<C-y>'] = cmp.mapping.confirm({ select = true }),
--	['<C-Space>'] = cmp.mapping.complete(),
-- })

cmp.setup({
	sources = {
		{name = 'nvim_lsp'}
	},
	mapping = cmp.mapping.preset.insert({

		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		['<C-Space>'] = cmp.mapping.complete(),
	})
})

-- lsp.set_preferences({
-- 	sign_icons = { }
-- })

--lsp.setup_nvim_cmp({
--	mapping = cmp_mappings
-- })

lsp.on_attach(function(client, bufnr) 
	-- print("help")
	local opts = {buffer = bufnr, remap=false}
   --  vim.lsp.buf.inlay_hint(bufnr, true)
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.lsp.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.lsp.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.lsp.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
	'tsserver',
	'eslint',
	'lua_ls',
	'rust_analyzer',
	'gopls',
	'clangd',
	'cmake',
	'dockerls',
	'docker_compose_language_service',
	-- 'java_language_server',
	--'ocamlls',
	'prismals',
	'pyright',
	'sqlls',
	'tailwindcss',
	'yamlls',
	'zls'
  },
  handlers = {
    lsp.default_setup,
  },
})

lsp.setup()
