#!/usr/bin/env ruby -wKU

months = Hash.new("month")

puts "#{months[0]}"
puts "#{months[72]}"

H = Hash["a" => 100, "b" => 200]

puts "#{H['a']}"
puts "#{H['b']}"

$, = ", "
months = Hash.new("month")

months = {"1" => "January", "2" => "February"}

keys = months.keys

puts "#{keys}"

