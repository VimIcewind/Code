(define (list*2 ls)
  (if (null? ls)
      '()
      (cons (* 2 (car ls))
            (list*2 (cdr ls)))))

(list*2 '())
(list*2 '(1 2 3))
