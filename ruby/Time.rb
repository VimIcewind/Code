#!/usr/bin/env ruby -wKU
# -*- coding: UTF-8 -*-

time1 = Time.new

puts "当前时间: " + time1.inspect

# Time.now 功能相同

time2= Time.now

puts "当前时间: " + time2.inspect

time = Time.new

# Time 的组件
puts "当前时间 : " + time.inspect
puts time.year
puts time.month
puts time.day
puts time.wday
puts time.yday
puts time.hour
puts time.min
puts time.sec
puts time.usec
puts time.zone

time = Time.new

values = time.to_a
p values
puts Time.utc(*values)

time = Time.new

puts time.to_s
puts time.ctime
puts time.localtime
puts time.strftime("%Y-%m-%d %H:%M:%S")

now = Time.now
puts now

past = now - 10     # 10 秒以前。Time - number => Time
puts past

future = now + 10   # 从现在开始 10 秒之后。Time + number => Time
puts future

diff = future =now  # => 10 Time -Time => 秒数
puts diff

