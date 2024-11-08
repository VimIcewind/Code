(defun a (x) (+ x 1))
(apply a 1 nil)

(setq a (lambda (x) (+ x 2)))
(apply 'a 1 nil)
