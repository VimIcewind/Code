#!/usr/bin/ruby
# -*- coding: UTF-8 -*-

x = 1
if x > 2
    puts "x 大于 2"
elsif x <= 2 and x != 0
    puts "x 是 1"
else
    puts "无法得知 x 的值"
end

$debug = 1
print "debug\n" if $debug

