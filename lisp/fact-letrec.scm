(define (fact-letrec n)
  (letrec ((iter (lambda (n1 p)
                   (if (= n1 1)
                     p
                     (let ((m (- n1 1)))
                       (iter m (* p m)))))))
    (iter n n)))

(fact-letrec 5)
