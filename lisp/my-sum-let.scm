(define (my-sum-let ls)
  (let loop((ls0 ls) (n 0))
    (if (null? ls0)
	n
	(loop (cdr ls0) (+ (car ls0) n)))))
