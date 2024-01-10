(cons 1 (cons 2 (cons 3 (cons 4 '()))))

(list 1 2 3 4)

(define 1-to-4 (list 1 2 3 4))

(car (cdr 1-to-4))
(car (cdr (cdr 1-to-4)))
1-to-4
(cdr 1-to-4)
(cdr (cdr 1-to-4))
(cdr (cdr (cdr (cdr 1-to-4))))

(define (scale-list s l)
  (if (null? l)
    '()
    (cons (* (car l) s)
          (scale-list s (cdr l))))))

(scale-list 10 1-to-4)

