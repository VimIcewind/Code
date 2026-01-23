(defun foo (a b)
  "Just echo 2 args."
  (interactive (list
		(read-string "Input a word: ")
		(read-number "Input a number: ")))
  (princ (format "%s %d" a b)))
