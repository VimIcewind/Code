#!/usr/bin/ruby

MR_COUNT = 0            # 定义在主 Object 类上的常量
module Foo
    MR_COUNT = 0
    ::MR_COUNT = 1      # 设置全局计数为 1
    MR_COUNT = 2        # 设置全局计数为 2
end
puts MR_COUNT           # 这是全局常量
puts Foo::MR_COUNT      # 这是"Foo"的局部常量
