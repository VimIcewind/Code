#!/usr/bin/ruby
# -*- coding: UTF-8 -*-

def sample (*test)
    puts "参数个数为 #{test.length}"
    for i in 0...test.length
        puts "参数值为 #{test[i]}"
    end
end
sample "Zara", "6", "F"
sample "Mac", "36", "M", "MCA"

