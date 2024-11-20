;; Continuation Passing Style
;; CPS demo

(define add2 (lambda (x f) (f (+ x 2))))

(define mul2 (lambda (x) (* x 2)))

(add2 1 mul2)



(define (return x)
  x)

(define (k+ a b k)
  (k (+ a b)))

(define (k* a b k)
  (k (* a b)))

(k+ 1 2 (lambda (x) (k* x 3 return)))
