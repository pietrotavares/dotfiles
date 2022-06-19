local keymap = require'sleipnir/utils'.keymap

keymap('n', '<Leader><Tab>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
keymap('n', '<Leader>z', ':lua require("harpoon.mark").add_file()<CR>')
keymap('n', '<Leader>1', ':lua require("harpoon.ui").nav_file(1)<CR>')
keymap('n', '<Leader>2', ':lua require("harpoon.ui").nav_file(2)<CR>')
keymap('n', '<Leader>3', ':lua require("harpoon.ui").nav_file(3)<CR>')
keymap('n', '<Leader>4', ':lua require("harpoon.ui").nav_file(4)<CR>')
keymap('n', '<Leader>5', ':lua require("harpoon.ui").nav_file(5)<CR>')
keymap('n', '<Leader>6', ':lua require("harpoon.ui").nav_file(6)<CR>')
keymap('n', '<Leader>7', ':lua require("harpoon.ui").nav_file(7)<CR>')
keymap('n', '<Leader>8', ':lua require("harpoon.ui").nav_file(8)<CR>')
keymap('n', '<Leader>9', ':lua require("harpoon.ui").nav_file(9)<CR>')
