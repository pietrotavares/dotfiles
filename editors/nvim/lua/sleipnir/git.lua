local keymap = require'sleipnir/utils'.keymap

keymap('n', '<Leader>ga', ':Git fetch --all<CR>')
keymap('n', '<Leader>grum', ':Git rebase upstream/master<CR>')
keymap('n', '<Leader>grumain', ':Git rebase upstream/main<CR>')
keymap('n', '<Leader>grom', ':Git rebase origin/master<CR>')
keymap('n', '<Leader>gromain', ':Git rebase origin/main<CR>')
