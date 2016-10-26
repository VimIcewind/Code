#!/usr/bin/ruby

for i in 1..5
    retry if i > 2
    puts "局部变量的值为 #{i}"
end
