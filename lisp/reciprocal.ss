(define reciprocal
  (lambda (n)
    (if (= n 0)
      "oops!"
      (/ 1 n))))

(reciprocal 10)
(reciprocal 1/10)
(reciprocal 0)
(reciprocal (reciprocal 1/10))
