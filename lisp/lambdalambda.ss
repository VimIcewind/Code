(define double (lambda (x) (* 2 x)))

(define use (lambda (f) (lambda (x) (f x))))

(double 5)
(double 10)
((use double) 5)
((use double) 10)
