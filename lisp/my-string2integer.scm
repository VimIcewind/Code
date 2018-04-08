(define (my-string->integer str)
  (char2int (string->list str) 0))

(define (char2int ls n)
  (if (null? ls)
      n
      (char2int (cdr ls)
		(+ (- (char->integer (car ls)) 48)
		   (* n 10)))))
