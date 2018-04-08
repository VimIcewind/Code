(define (my-string->integer-letrec str)
  (letrec ((iter (lambda (ls0 n)
		   (if (null? ls0)
		       n
		       (iter (cdr ls0)
			     (+ (- (char->integer (car ls0)) 48)
				(* n 10)))))))
    (iter (string->list str) 0)))
