(defun foo (a b)
  "Just echo 2 args."
  (interactive "sInput a word: 
nInput a number: ")
  (princ (format "%s %d" a b)))
