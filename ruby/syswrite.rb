#!/usr/bin/env ruby -wKU

aFile = File.new("input.txt", "r+")
if aFile
    aFile.syswrite("ABCDEF")
else
    puts "Unable to open file!"
end
