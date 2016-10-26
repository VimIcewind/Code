#!/usr/bin/env ruby -wKU

aFile = File.new("input.txt", "r+")
if aFile
    aFile.syswrite("ABCDEF")
    aFile.rewind
    aFile.each_byte { |ch| putc ch; putc ?. }
else
    puts "Unalbe to open file!"
end
