vim.cmd([[
    let g:nvimgdb_disable_start_keymaps = 1
    let g:nvimgdb_use_find_executables = 0
    let g:nvimgdb_config_override = {
      \ 'key_next': '<f6>',
      \ 'key_step': '<f7>',
      \ 'key_finish': '<f8>',
      \ 'key_continue': '<f5>',
      \ 'key_until': 'u',
      \ 'key_breakpoint': 'b',
  \ }
]])

vim.cmd([[
  nnoremap <silent> <expr> <leader>dd ":GdbStart gdb -q " . input("debugee file path: ") . "\<ESC>"
]])
