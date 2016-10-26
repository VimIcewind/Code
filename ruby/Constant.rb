#!/usr/bin/ruby
# -*- coding: UTF-8 -*-

class Example
    VAR1 = 100
    VAR2 = 200
    def show
        puts "第一个变量的值为 #{VAR1}"
        puts "第二个变量的值为 #{VAR2}"
    end
end

object=Example.new()
object.show
