(define (range n)
  (let loop((i 0) (ls1 ()))
    (if (= i n)
	(reverse ls1)
	(loop (1+ i) (cons i ls1)))))
