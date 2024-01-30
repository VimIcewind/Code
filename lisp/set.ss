(set! pi 3.14)
(display pi)
(newline)

(define count 1)
(display count)

(newline)

(define (demo x)
  (set! count (1+ count))
  (+ x count))

;; 5
(demo 3)
;; 6
(demo 3)
