original = """
def runaway():
    prit "running away..."
"""
import re
pattern = re.compile(r"def (\w+\(\):)")
wrapped = pattern.sub(r"@get_car\ndef \1", original)
print original, "--->", wrapped, "----"
"""outputs
def runaway():
    print "running away..."
--->
@get_car
def runaway():
    print "running away..."
----
"""
