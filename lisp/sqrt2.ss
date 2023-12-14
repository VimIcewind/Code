(define (sqrt x)
  (define (try guess)
    (if (good-enough? guess)
        guess
        (try (improve guess))))

  (define (good-enough? guess)
    (< (abs (- (square guess) x))
       0.001))

  (define (square x)
    (* x x))

  (define (improve guess)
    (average guess (/ x guess)))

  (define (average x y)
    (/ (+ x y) 2))

  (try 1.0))

(sqrt 100)

