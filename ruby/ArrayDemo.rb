#!/usr/bin/ruby

digits = Array(0..9)

puts "#{digits}"

num = digits.at(6)

puts "#{num}"

a = ["a", "b", "c"]
n = [65, 66, 67]
puts a.pack("A3A3A3")
puts a.pack("a3a3a3")
puts n.pack("ccc")
