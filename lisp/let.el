(defun foo ()
  (let ((n 3))
    (message "%d" n)))

(foo)
;; (message "%d" n) ;; ERROR Debugger entered--Lisp error: (void-variable ERROR)

(let ((a "Hello")
      (b 3.1415926))
  (message "%s %f" a b))
