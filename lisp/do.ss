(define (fact-do n)
  (do ((n1 n (- n1 1)) (p n (* p (- n1 1))))
    ((= n1 1) p)
    ; (display p)
    ; (newline)
    ))

(fact-do 5)
