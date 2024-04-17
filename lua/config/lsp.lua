-- lsp.lua: Configurations related to the Language Server Protocol
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
-- Setup for lspconfig, mason, and related setups
