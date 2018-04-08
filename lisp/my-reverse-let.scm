(define (my-reverse-let ls)
  (let loop((ls0 ls) (ls1 ()))
    (if (null? ls0)
	ls1
	(loop (cdr ls0) (cons (car ls0) ls1)))))
