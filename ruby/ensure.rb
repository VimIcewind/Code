#!/usr/bin/env ruby -wKU

begin
    raise 'A test exception.'
rescue Exception => e
    puts e.message
    puts e.backtrace.inspect
ensure
    puts "Ensuring execution"
end

