content = """
          alice@google.com
          alice-bob@gmail.._com gmail
          alice.bob@apple.com apple
          alice.bob@gmailcom invalied gmail
          """
import re
address = re.compile(r'[\w.-]+@[\w-]+\.[\w.-]+')
print address.findall(content)
'''
outpus:
['alice@google.com', 'alice-bob@gmail.._com', 'alice.bob@apple.com']
'''
