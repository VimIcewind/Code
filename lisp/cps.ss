;; Continuation Passing Style
;; CPS demo

(define add2 (lambda (x f) (f (+ x 2))))

(define mul2 (lambda (x) (* x 2)))

(add2 1 mul2)
