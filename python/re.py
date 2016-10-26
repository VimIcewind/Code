import re
content = "aababbaxz abcabb abbbbabb"
pattern = re.compile("[a|b]*abb")
print pattern.findall(content)
# outputs: ['aababb', 'abb', 'abbbbabb']
