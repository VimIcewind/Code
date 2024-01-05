(define (sqrt x)
  (newton (lambda (y) (- x (square y)))
          1))

(define (square x)
  (* x x))

(define (fixed-point f start)
  (define tolerance 0.00001)
  (define (close-enuf? u v)
    (< (abs (- u v)) tolerance))
  (define (iter old new)
    (if (close-enuf? old new)
      new
      (iter new (f new))))
  (iter start (f start)))

(define (newton f guess)
  (define df (deriv f))
  (fixed-point
    (lambda (x) (- x (/ (f x) (df x))))
    guess))

(define (newton f guess)
  (fixed-point
    (lambda (x) (- x (/ (f x) ((deriv f) x))))
    guess))

(define deriv
  (lambda (f)
    (lambda (x)
      (/ (- (f (+ x dx))
            (f x))
         dx))))

(define dx  .000001)

(sqrt 9.0)
