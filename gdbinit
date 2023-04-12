# 配置`(gdb)`的颜色
set prompt \033[35m(gdb) \033[0m
# 红色：\033[31m
# 绿色：\033[32m
# 黄色：\033[33m
# 洋红色：\033[35m
# 青色：\033[36m

# STL输出优化
python
import sys
sys.path.insert(0, '/usr/share/gcc/python')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)
end
