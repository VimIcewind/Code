(write "Hi, ChezScheme!")

(write "Hi, ChezScheme!" (open-output-file "hi.txt"))

(write-char #\! (open-output-file "hi1.txt"))
