(define (make-rat n d)
  (cons n d))

(define (numer x)
  (car x))

(define (denom x)
  (cdr x))


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

