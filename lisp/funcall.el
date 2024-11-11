(defun a (x) (+ x 1))
(a 1)
(funcall 'a 1)

(setq b (lambda (x) (+ x 2)))
(funcall b 2)
