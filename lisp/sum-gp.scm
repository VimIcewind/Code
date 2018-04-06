; sum of geometric progression
(define (sum-gp a0 r n)
  (* a0
     (if (= r 1)
	 n
       (/ (- 1 (expt r n)) (- 1 r)))))	;!!
