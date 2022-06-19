" TODO: Do this in Lua (lsp.lua)
let g:LanguageClient_serverCommands = {
  \ 'cpp': ['clangd'],
  \ }

nnoremap <Leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <Leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <Leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <Leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <Leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <Leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <Leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <Leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <Leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
