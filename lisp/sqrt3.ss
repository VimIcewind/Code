(define (sqrt x)
  (fixed-point
    (lambda (y) (average (/ x y) y))
    1))

(define (average x y)
  (/ (+ x y) 2))

(define (fixed-point f start)
  (define tolerance 0.00001)
  (define (close-enuf? u v)
    (< (abs (- u v)) tolerance))
  (define (iter old new)
    (if (close-enuf? old new)
      new
      (iter new (f new))))
  (iter start (f start)))

(sqrt 9.0)
