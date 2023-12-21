(define (area-of-circle r)
  (define (sqare x)
    (* x x))
  (* 3.14 (sqare r)))

(display (area-of-circle 2))
(newline)
