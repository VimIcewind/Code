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


(define var 1)
(display var)
(newline)
(set! var (* var 10))
(display var)
(newline)

(let ((i 1))
  (set! i (+ i 3))
  i)
