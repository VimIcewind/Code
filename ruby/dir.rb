#!/usr/bin/env ruby -wKU

Dir.chdir("/root/Code/ruby/")

puts Dir.pwd
puts Dir.entries("/root/Code/ruby/").join( ' ')

Dir.foreach("/root/Code/ruby/") do |entry|
    puts entry
end

puts Dir["/root/Code/ruby/*"]

Dir.delete("newdir")
Dir.delete("mynewdir")

Dir.mkdir("newdir")
Dir.mkdir("mynewdir", 755)

