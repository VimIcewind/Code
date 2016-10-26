#!/usr/bin/env ruby -wKU

begin
    puts "I'm not raising exception"
rescue Exception => e
    puts.e.message
    puts e.backtrace.inspect
else
    puts "Congratulations-- no errors!"
ensure
    puts "Ensuring execution"
end
