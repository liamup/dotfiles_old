local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  vim.notify("mason-lspconfig not found!")
  return
end

mason_lspconfig.setup({
})

-- 关联cmp: https://github.com/williamboman/mason.nvim/discussions/77
local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  vim.notify("Couldn't load LSP-Config" .. lspconfig, "error")
  return
end

local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
    flags = {
        debounce_text_changes = 150,
    }
}

mason_lspconfig.setup_handlers({
    function(server)
        lspconfig[server].setup(opts)
    end,

    ["clangd"] = function ()
        local clangd_opts = require("user.lsp.settings.clangd")
        clangd_opts = vim.tbl_deep_extend("force", clangd_opts, opts)
        lspconfig.clangd.setup(clangd_opts)
    end,

    ["jsonls"] = function ()
        local jsonls_opts = require("user.lsp.settings.jsonls")
        jsonls_opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
        lspconfig.jsonls.setup(jsonls_opts)
    end,

    ["lua_ls"] = function ()
        local lua_ls_opts = require("user.lsp.settings.lua_ls")
        lua_ls_opts = vim.tbl_deep_extend("force", lua_ls_opts, opts)
        lspconfig.lua_ls.setup(lua_ls_opts)
    end,

    ["pyright"] = function ()
        local pyright_opts = require("user.lsp.settings.pyright")
        pyright_opts = vim.tbl_deep_extend("force", pyright_opts, opts)
        lspconfig.pyright.setup(pyright_opts)
    end
})
