#!/usr/bin/env ruby -wKU

File.open(path, "w") do |file|
    begin
    rescue
        raise FileSaveError.new($!)
    end
end

