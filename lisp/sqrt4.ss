(define (sqrt x)
  (fixed-point
    (average-damp (lambda (y) (/ x y)))
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

(define (average-damp f)
    (define (foo x)
      (average (f x) x))
    foo)

(define (average-damp f)
    (lambda (x) (average (f x) x))))

(define average-damp
  (lambda (f)
    (lambda (x) (average (f x) x))))

(sqrt 9.0)
