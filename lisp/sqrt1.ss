(define (sqrt x)
  (define (try guess x)
    (if (good-enough? guess x)
        guess
        (try (improve guess x) x)))

  (define (good-enough? guess x)
    (< (abs (- (square guess) x))
       0.001))

  (define (square x)
    (* x x))

  (define (improve guess x)
    (average guess (/ x guess)))

  (define (average x y)
    (/ (+ x y) 2))

  (try 1.0 x))

(sqrt 100)

