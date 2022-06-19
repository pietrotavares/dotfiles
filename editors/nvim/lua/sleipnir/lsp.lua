local function on_attach()
end

require'lspconfig'.ansiblels.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.cmake.setup{}
require'lspconfig'.clangd.setup {
    on_attach = on_attach,
    root_dir = function() return vim.loop.cwd() end
}
require'lspconfig'.dockerls.setup{}
require'lspconfig'.gopls.setup{
    on_attach=on_attach,
    cmd = {"gopls", "serve"},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}
require'lspconfig'.graphql.setup{}
require'lspconfig'.jedi_language_server.setup{
    on_attach=on_attach,
}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.terraformls.setup{}
require'lspconfig'.vimls.setup{}
require'lspconfig'.yamlls.setup{}

local opts = {
    highlight_hovered_item = true,
    show_guides = true,
}
require('symbols-outline').setup(opts)
