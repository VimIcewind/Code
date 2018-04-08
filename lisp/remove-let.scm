(define (remove x ls)
  (let loop((ls0 ls) (ls1 ()))
    (if (null? ls0)
	(reverse ls1)
	(loop
	 (cdr ls0)
	 (if (eqv? x (car ls0))
	     ls1
	     (cons (car ls0) ls1))))))
