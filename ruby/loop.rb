#!/usr/bin ruby
# -*- coding: UTF-8 -*-

$i = 0
$num = 5

while $i < $num do
    puts("在循环语句中 i = #$i")
         $i += 1
end

$i = 0
$num = 5
begin
    puts("在循环语句中 i = #$i")
    $i += 1
end while $i < $num

$i = 0
$num = 5

until $i > $num do
    puts("在循环语句中 i = #$i")
    $i += 1;
end

$i = 0
$num = 5
begin
    puts("在循环语句中 i = #$i")
    $i += 1;
end until $i > $num

for i in 0..5
    puts "局部变量的值为 #{i}"
end

(0..5).each do |i|
    puts "局部变量的值为 #{i}"
end

for i in 0..5
    if i > 2 then
        break
    end
    puts "局部变量的值为 #{i}"
end

for i in 0..5
    if i < 2 then
        next
    end
    puts "局部变量的值为 #{i}"
end

for i in 0..5
    if i < 2 then
        puts "局部变量的值为 #{i}"
        #redo
    end
end

