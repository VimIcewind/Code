(define (imap f x . y)
  (if (null? y)
      (if (null? x)
	  '()
	  (cons (f (car x)) (imap f (cdr x))))
      (if (null? x)
	  '()
	  (cons (apply f (car x) (imap car y))
		(apply imap f (cdr x) (imap cdr y))))))

(define (imap-let f x . y)
  (if (null? y)
      (let recur ((x x))
	(if (null? x)
	    '()
	    (cons (f (car x)) (recur (cdr x)))))
      (let recur (( x x) (y y))
	(if (null? x)
	    '()
	    (cons (apply f (car x) (imap car y)) (recur (cdr x) (imap cdr y)))))))