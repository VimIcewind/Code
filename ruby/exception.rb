#!/usr/bin/env ruby -wKU

begin
    file = open("/unexistant_file")
    if file
        puts "File opened successfully"
    end
    rescue
        file = STDIN
end
print file, "==", STDIN, "\n"

