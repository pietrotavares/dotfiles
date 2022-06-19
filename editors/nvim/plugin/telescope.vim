nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>fs :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <Leader>ff :lua require('telescope.builtin').find_files()<CR>
nnoremap <Leader>fb :lua require('telescope.builtin').buffers()<CR>
nnoremap <Leader>fh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <Leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <Leader>gm :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>
