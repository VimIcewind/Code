(define f
      (let ((x 1))
	(lambda (y) (* x y))))
(let ((x 2))
  (f 2))
(let ((x 3))
  (f 2))
(f 2)
(display f)
