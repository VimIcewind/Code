(defun a (x) (+ x 1))
(apply 'a 1 nil)

(setq b (lambda (x) (+ x 2)))
(apply b 2 nil)
