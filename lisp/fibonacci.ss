(define (fibonacci n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+
                (fibonacci (- n 1))
                (fibonacci (- n 2))))))

(display (fibonacci 10))
(newline)


(define (fibonacci n)
  (define (fibonacci-iter a b count)
    (if (= count 0)
      b
      (fibonacci-iter (+ a b) a (- count 1))))
  (fibonacci-iter 1 0 n))

(display (fibonacci 10))
(newline)
