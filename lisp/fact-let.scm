(define (fact-let n)
  (let loop((n1 n) (p n))
    (if (= n1 1)
      p
      (let ((m (- n1 1)))
        (loop m (* p m))))))

(fact-let 5)
