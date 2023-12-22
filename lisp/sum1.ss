(define (sum1 x)
  (let ((a (+ x 1)))
    (+ a (* a a))))

(display (sum1 10))
(newline)

