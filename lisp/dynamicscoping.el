(setq f
      (let ((x 1))
	(lambda (y) (* x y))))
(let ((x 2))
  (funcall f 2))
(let ((x 3))
  (funcall f 2))
;;(funcall f 2)
