(define (my-string->integer-do str)
  (do ((ls0 (string->list str) (cdr ls0))
       (n 0 (+ (- (char->integer (car ls0)) 48)
	       (* n 10))))
      ((null? ls0) n)))
