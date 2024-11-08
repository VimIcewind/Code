(defun a (x) (+ x 1))
(funcall a 1)

(setq a (lambda (x) (+ x 2)))
(funcall 'a 1)
