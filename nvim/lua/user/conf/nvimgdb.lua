-- NOTE: nvimgdb 依赖 gdb with python support
-- 检查方式为: gdb --config
-- 输出类似如下:
  --with-python=/usr
  --with-python-libdir=/usr/lib

-- 如果不支持python, 需要从源码编译gdb:
-- 1. 下载gdb源码: https://ftp.gnu.org/gnu/gdb/, 并解压
-- 2. ./configure --with-python
-- 3. make
-- 4. make install


vim.cmd([[
    let g:nvimgdb_disable_start_keymaps = 1
    let g:nvimgdb_use_find_executables = 0
    let g:nvimgdb_config_override = {
      \ 'key_next': ';n',
      \ 'key_step': ';s',
      \ 'key_finish': ';f',
      \ 'key_continue': ';c',
      \ 'key_until': ';u',
      \ 'key_breakpoint': ';b',
  \ }
]])

vim.cmd([[
  nnoremap <silent> <expr> <leader>dd ":GdbStart gdb -q " . input("debugee file path: ") . "\<ESC>"
]])
