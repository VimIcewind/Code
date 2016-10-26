strings = ["HelloWorld!",
           "Hello World!"]
import re
pattern = re.compile(r"Hello(?!World).*")
for string in strings:
    result = pattern.search(string)
    if result:
        print string, "> ", result.group()
    else:
        print string, "> ", "Not match"
'''
outputs:
HelloWorld! > Not match
Hello World! > Hello World!
'''
