function keymap(mode, lhs, rhs, opts)
  return vim.api.nvim_set_keymap(mode, lhs, rhs, vim.tbl_extend('keep', opts or {}, {
        nowait = true,
        silent = true,
        noremap = true,
    }))
end

vim.g.mapleader = ' '

-- Easier file save
keymap('n', '<Leader>w', '<cmd>:w!<CR>')

-- Breakpoints for 'Undo'
keymap('i', ',', ',<c-g>u')
keymap('i', '.', '.<c-g>u')
keymap('i', ';', ';<c-g>u')
keymap('i', '(', '(<c-g>u')
keymap('i', '{', '{<c-g>u')
keymap('i', '?', '?<c-g>u')

-- Get 'Y' to behave like 'C' or 'D'
-- (and yank to the end of the line)
keymap('n', 'Y', 'y$')

-- Keep highlighted text centered while cycling through search matches
keymap('n', 'n', 'nzzzv')
keymap('n', 'N', 'Nzzzv')
keymap('n', 'J', 'mzJ`z')

-- Cycle between the (two) last active buffers
keymap('n', '<Leader><tab>', '<c-^>')

-- Open vertical split
keymap('n', '<Leader>v', '<C-w>v')

-- Jump to definition in vertical split
keymap('n', '<Leader>]', '<C-W>v<C-]>')

-- Close all other buffers except the current one
keymap('n', '<Leader>db', ':silent w <BAR> :silent %bd <BAR> e#<CR>')

-- Move lines around without resorting to ugly cut-n'-paste mechanics
keymap('v', 'J', ":m '>+1<CR>gv=gv")
keymap('v', 'K', ":m '<-2<CR>gv=gv")

-- Indenting in visual mode
keymap('x', '<s-tab>', '<gv')
keymap('x', '<tab>', '>gv')
