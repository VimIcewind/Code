(define (unless p c a)
  (cond ((not p) c)
        (else a)))

(unless (= 1 0) 2 (/ 1 0))

(cond ((not (= 1 0)) 2)
      (else (/ 1 0)))


(define (unless p (name c) (name a))
  (cond ((not p) c)
        (else a)))
