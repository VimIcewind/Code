#!/usr/bin/ruby
names = Array.new(20)
puts names.size    # 返回 20
puts names.length  # 返回 20

names = Array.new(4, "mac")

puts "#{names}"

nums = Array.new(10) { |e| e = e * 2 }

puts "#{nums}"
