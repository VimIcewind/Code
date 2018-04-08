(define (my-string->integer-let str)
  (let loop((ls0 (string->list str)) (n 0))
    (if (null? ls0)
	n
	(loop (cdr ls0)
	      (+ (- (char->integer (car ls0)) 48)
		 (* n 10))))))
