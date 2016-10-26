#!/usr/bin/env ruby -wKU

$, = ", "   # Array 值分隔符
range1 = (1..10).to_a
range2 = ('bar'..'bat').to_a

puts "#{range1}"
puts "#{range2}"

digits = 0..9

puts digits.include?(5)
ret = digits.min
puts "最小值为 #{ret}"

ret = digits.max
puts "最大值为 #{ret}"

ret = digits.reject {|i| i < 5}
puts "不符合条件的有 #{ret}"

digits.each do |digit|
    puts "在循环中 #{digit}"
end

score = 70
result = case score
when 0..40
    "糟糕的分数"
when 41..60
    "快要及格"
when 61..70
    "及格分数"
when 71..100
    "良好分数"
else
    "错误的分数"
end

puts result

if ((1..10) === 5)
    puts "5 in (1..10)"
end

if (('a'..'j') === 'c')
    puts "'c' in ('a'..'j')"
end

if (('a'..'j') === 'z')
    puts "z in ('a'..'j')"
end

