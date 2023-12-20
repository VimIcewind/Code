(-1+ 1)
(1+ 1)
(display "\n")

(define (+ x y)
  (if (= x 0)
      y
      (+ (-1+ x) (1+ y))))
(+ 3 4)
(+ 2 5)
(+ 0 7)
(display "\n")

(define (+ x y)
  (if (= x 0)
      y
      (1+ (+ (-1+ x) y))))
(+ 3 4)
(+ 2 5)
(+ 0 7)
(display "\n")
