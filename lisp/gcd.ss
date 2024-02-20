(define (remainder n d)
  (if (< n d)
      n
      (remainder (- n d) d)))

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

(gcd 30 42)
