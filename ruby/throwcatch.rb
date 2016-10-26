def promptAndGet(prompt)
    print prompt
    res = readline.chomp
    throw :quitRequestd if res == "!"
    return res
end

catch :quitRequested do
    name = promptAndGet("Name: ")
    age = promptAndGet("Age: ")
    sex = promptAndGet("Sex: ")
end

promptAndGet("Name:")
