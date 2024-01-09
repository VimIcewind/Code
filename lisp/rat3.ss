(define (make-rat n d)
  (cons n d))

(define (numer x)
  (let ((g (gcd (car x) (cdr x))))
  (/ (car x) g)))

(define (denom x)
  (let ((g (gcd (car x) (cdr x))))
  (/ (cdr x) g)))


(define (+rat x y)
  (make-rat
    (+ (* (numer x) (denom y))
       (* (numer y) (denom x)))
    (* (denom x) (denom y))))

(define (*rat x y)
  (make-rat
    (* (nuber x) (nuber y))
    (* (denom x) (denom y))))


(define a (make-rat 1 2) )
(define b (make-rat 1 4) )
(define ans (+rat a b))

(numer ans)
(denom ans)


