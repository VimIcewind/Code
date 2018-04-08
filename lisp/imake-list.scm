(define (imake-list n member)
  (if (= 1 n)
      (cons member '())
      (cons member (imake-list (- n 1) member))))


(define (imake-list-let n member)
  (let recur ((n n))
    (if (= 1 n)
	(cons member '())
	(cons member (recur (- n 1))))))
