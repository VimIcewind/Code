#!/usr/bin/ruby
# -*- coding: UTF-8 -*-

x = 1
unless x > 2
    puts "x 小于 2"
else
    puts "x 大于 2"
end

$var = 1
print "1 -- 这行输出\n" if $var
print "2 -- 这行不输出\n" unless $var

$var = false
print "3 -- 这一行输出\n" unless $var
