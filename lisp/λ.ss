;; define λ as lambda
(define-syntax λ (syntax-rules () ((_ param body ...) (lambda param body ...))))


(define (square x) (* x x))

(display (square 5))
(newline)


(define square (lambda (x) (* x x)))

(display (square 5))
(newline)


(define square (λ (x) (* x x)))

(display (square 5))
(newline)


(define double (lambda (x) (* 2 x)))

(define use (lambda (f) (lambda (x) (f x))))

(double 5)
(double 10)
((use double) 5)
((use double) 10)


(define double (λ (x) (* 2 x)))

(define use (λ (f) (λ (x) (f x))))

(double 5)
(double 10)
((use double) 5)
((use double) 10)

