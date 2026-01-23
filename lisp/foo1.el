(defun foo (a b)
  "Just echo 2 args."
  (interactive "sInput a word:\nnInput a number: ")
  (princ (format "%s %d" a b)))
