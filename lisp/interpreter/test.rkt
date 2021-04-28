#lang racket

(let ([x 1]
      [y 2])
  (+ x y))

'(+ 1 2)
(+ 1 2)

'(* (+ 1 2) (+ 3 4))
(* (+ 1 2) (+ 3 4))

(((lambda (x)
    (lambda (y) (+ x y)))
  1)
 2)
;; => 3

(let ([x 1])
  (let ([y 2])
    (+ x y)))

(let ([x 1])
  (let ([y 2])
    (let ([x 3])
      (+ x y))))
;; => 5

(let ([x 1])
  (+ (let ([x 2])
       x)
     x))
;; => 5

;; Scheme
(let ([x 2])
  (let ([f (lambda (y) (* x y))])
    (let ([x 4])
      (f 3))))
;; => 6
