local completion = {}
local utils = require'sleipnir/utils'
utils.opt('o', 'pumheight' , 15)
vim.cmd('set completeopt=menuone,noselect')

require'compe'.setup({
  enabled = true,
  debug = false,
  min_length = 1,
  preselect = 'disable',
  source = {
    path = true,
    buffer = { ignored_filetypes = {'sql'}, priority = 90 },
    tags = { ignored_filetypes = {'sql'}, priority = 80 },
    vsnip = true,
    nvim_lsp = true,
    vim_dadbod_completion = true,
    nvim_lua = false,
    calc = true,
    ripgrep = { ignored_filetypes = {'sql'} },
    orgmode = true
  }
})

local function check_back_space()
  local col = vim.fn.col('.') - 1
  return col <= 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

function completion.tab_completion()
  if vim.fn['vsnip#jumpable'](1) > 0 then
    return utils.esc('<Plug>(vsnip-jump-next)')
  end

  if vim.fn.pumvisible() > 0 then
    return utils.esc('<C-n>')
  end

  if check_back_space() then
    return utils.esc('<TAB>')
  end

  if vim.fn['vsnip#expandable']() > 0 then
    return utils.esc('<Plug>(vsnip-expand)')
  end

  return vim.fn['compe#complete']()
end

utils.keymap('i', '<TAB>', 'v:lua.sleipnir.completion.tab_completion()', { expr = true, noremap = false })

utils.keymap('i', '<S-TAB>', 'pumvisible() ? "<C-p>" : vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-TAB>"', {
  expr = true,
  noremap = false
})

utils.keymap('s', '<TAB>', 'vsnip#available(1)  ? "<Plug>(vsnip-expand-or-jump)" : "<TAB>"', {
  expr = true,
  noremap = false
})

utils.keymap('s', '<S-TAB>', 'vsnip#available(-1)  ? "<Plug>(vsnip-jump-prev)" : "<S-TAB>"', {
  expr = true,
  noremap = false
})

vim.opt.wildignore = {
  '*.o',
  '*.obj,*~',
  '*.git*',
  '*.meteor*',
  '*vim/backups*',
  '*sass-cache*',
  '*mypy_cache*',
  '*__pycache__*',
  '*cache*',
  '*logs*',
  '*node_modules*',
  '**/node_modules/**',
  '*DS_Store*',
  '*.gem',
  'log/**',
  'tmp/**',
}

_G.sleipnir.completion = completion
