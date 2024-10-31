(define (fact-tail n)
  (fact-rec n n))

(define (fact-rec n p)
  (if (= n 1)
    p
    (let ((m (- n 1)))
      (fact-rec m (* p m)))))

(fact-tail 5)
