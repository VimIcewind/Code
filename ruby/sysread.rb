#!/usr/bin/env ruby -wKU

aFile = File.new("input.txt", "r")

if aFile
    content = aFile.sysread(2000)
    puts content
else
    puts "Unalbe to open file!"
end
