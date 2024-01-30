;; Functional programs encode mathematical truths
(define (fact n)
  (cond ((= n 1) 1)
        (else (* n (fact (- n 1))))))

;; Processes evolved by such programs
;; can be understood by substitution:
(fact 4)
(* 4 (fact 3))
(* 4 (* 3 (fact 2)))
(* 4 (* 3 (* 2 (fact 1))))
(* 4 (* 3 (* 2 1)))
(* 4 (* 3 2))
(* 4 6)
24
