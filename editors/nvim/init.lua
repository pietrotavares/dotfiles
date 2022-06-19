_G.sleipnir = {}
require'sleipnir/plugins'
require'sleipnir/treesitter'
require'sleipnir/lsp'
require'sleipnir/completion'
require'sleipnir/autopairs'
require'sleipnir/fzf'
require'sleipnir/colors'
require'sleipnir/statusline'
require'sleipnir/formatter'
require'sleipnir/mappings'
require'sleipnir/opts'
require'sleipnir/saga'
require'sleipnir/session'
require'sleipnir/spell'
require'sleipnir/telescope'
require'sleipnir/harpoon'

P = function(v)
  print(vim.inspect(v))
  return v
end

if pcall(require, 'plenary') then
  RELOAD = require('plenary.reload').reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end
