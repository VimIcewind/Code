#!/usr/bin/env ruby -wKU

require 'tmpdir'

tempfilename = File.join(Dir.tmpdir, "tingtong")
tempfile = File.new(tempfilename, "w")
tempfile.puts "This is a  temporary file"
tempfile.close
File.delete(tempfilename)
