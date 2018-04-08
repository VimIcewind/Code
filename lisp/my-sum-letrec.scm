(define (my-sum-letrec ls)
  (letrec ((iter (lambda (ls0 n)
		   (if (null? ls0)
		       n
		       (iter (cdr ls0) (+ (car ls0) n))))))
    (iter ls 0)))
