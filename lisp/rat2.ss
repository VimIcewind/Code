; defining +rat without data abstraction

(define (+rat x y)
  (cons (+ (* (car x) (cdr y))
           (* (car y) (cdr x)))
        (* (cdr x) (cdr y))))

(define (make-rat n d)
  (cons n d))

(define (numer x)
  (let ((g (gcd (car x) (cdr x))))
    (/ (car x) g)))

(define (denom x)
  (let ((g (gcd (car x) (cdr x))))
    (/ (cdr x) g)))



(define a (make-rat 1 2) )
(define b (make-rat 1 4) )

(define ans (+rat a b))
(numer ans)
(denom ans)
