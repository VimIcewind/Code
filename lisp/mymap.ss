(define (mymap fn items)
  (if (null? items)
    '()
    (cons (fn (car items))
          (mymap fn (cdr items)))))

(display (mymap abs (list -1 2 -3)))
(newline)
