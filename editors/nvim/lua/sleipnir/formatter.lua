-- Format on pre-save (WritePre in Vim jargon)
vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePre *.go, *.py, *.lua, *.c, *.sh, *.yaml, *.md : vim.lsp.buf.formatting_sync()
augroup END
]],
  true
)
