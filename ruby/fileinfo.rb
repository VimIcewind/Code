#!/usr/bin/env ruby -wKU

File.open("file.rb") if File::exists?("file.rb")

File.file?("test.txt")

File::directory?("/usr/local/bin")

File::directory?("file.rb")

File.readable?("test.txt")
File.writable?("test.txt")
File.executable("test.txt")

File.zero?("test.txt")

File.size?("test.txt")

File::ftype("test.txt")

File::ctime("test.txt")
File::mtime("text.txt")
File::atime("text.txt")
