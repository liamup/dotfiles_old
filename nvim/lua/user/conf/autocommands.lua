vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200})
    autocmd BufWinEnter * set formatoptions-=cro
  augroup end
  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end
  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  " augroup _auto_resize
  "   autocmd!
  "   autocmd VimResized * tabdo wincmd =
  " augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  augroup _fold_bug_solution
    autocmd!
    autocmd BufRead * autocmd BufWinEnter * ++once normal! zx
  augroup end

  augroup _load_break_points
    autocmd!
    autocmd FileType c,cpp,go,python,lua :lua require('user.dap.dap-util').load_breakpoints()
  augroup end

  augroup _auto_format
    autocmd!
    autocmd BufWritePost * :FormatWrite
  augroup end

  augroup _auto_rainbow
    autocmd!
    autocmd InsertLeave *.cpp :TSDisable rainbow
    autocmd InsertLeave *.cpp :TSEnable rainbow
  augroup end
]]
