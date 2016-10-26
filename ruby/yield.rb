#!/usr/bin/ruby
# -*- coding: UTF-8 -*-

def test
    yield
end
test { puts "Hello world" }

def test
    puts "在 test 方法内"
    yield
    puts "你又回到 test 方法内"
    yield
end
test {puts "你在块内"}

def test
    yield 5
    puts "在 test 方法内"
    yield 100
end
test {|i| puts "你在块 #{i} 内"}

def test
    yield 5, 6
    puts "在 test 方法内"
    yield 100, 110
end
test {|i, j| puts "你在块 #{i} #{j} 内"}


def test(&block)
    block.call
end
test {puts "Hello World"}

