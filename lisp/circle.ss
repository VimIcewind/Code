(define (circle x y)
  (plot x y)
  (circle (- x (* y dt))
          (+ y (* x dt))))
