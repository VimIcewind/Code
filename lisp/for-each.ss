(define sum 0)
(for-each (lambda (x) (set! sum (+ sum x))) '(1 2 3 4))
(display sum)
