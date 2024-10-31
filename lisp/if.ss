(define (abs x)
  (if (< x 0)
    (- 0 x)
    x))


(abs 1)
(abs 0)
(abs -1)

(define (sum-gp a0 r n)
  (* a0
     (if (= r 1)
       n
       (/ (- 1 (expt r n)) (- 1 r)))))

(sum-gp 1 1 10)
(sum-gp 1 2 10)
