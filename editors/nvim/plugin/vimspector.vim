fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

" Debugger remaps
nnoremap <Leader>m :MaximizerToggle!<CR>
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <Leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <Leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <Leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <Leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <Leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>

nnoremap <Leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver
nmap <Leader>dk <Plug>VimspectorStepOut
nmap <Leader>d_ <Plug>VimspectorRestart
nnoremap <Leader>d<space> :call vimspector#Continue()<CR>

nmap <Leader>drc <Plug>VimspectorRunToCursor
nmap <Leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <Leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

