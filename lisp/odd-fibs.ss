(define (odd-fibs n)
  (define (next k)
    (if (> k n)
      '()
      (let ((f (fib k)))
        (if (odd? f)
            (cons f (next (1+ k)))
            (next (1+ k))))))
  (next 1))
