;;; tests

;; var
(cps 'x)
(cps '(lambda (x) x))
(cps '(lambda (x) (x 1)))


;; no lambda (will generate identity functions to return to the toplevel)
(cps '(if (f x) a b))
(cps '(if x (f a) b))


;; if stand-alone (tail)
(cps '(lambda (x) (if (f x) a b)))


;; if inside if-test (non-tail)
(cps '(lambda (x) (if (if x (f a) b) c d)))


;; both branches are trivial, should do some more optimizations
(cps '(lambda (x) (if (if x (zero? a) b) c d)))


;; if inside if-branch (tail)
(cps '(lambda (x) (if t (if x (f a) b) c)))


;; if inside if-branch, but again inside another if-test (non-tail)
(cps '(lambda (x) (if (if t (if x (f a) b) c) e w)))


;; if as operand (non-tail)
(cps '(lambda (x) (h (if x (f a) b))))


;; if as operator (non-tail)
(cps '(lambda (x) ((if x (f g) h) c)))


;; why we need more than two names
(cps '(((f a) (g b)) ((f c) (g d))))



;; factorial
(define fact-cps
(cps
'(lambda (n)
((lambda (fact)
((fact fact) n))
(lambda (fact)
(lambda (n)
(if (zero? n)
1
(* n ((fact fact) (sub1 n))))))))))

;; print out CPSed function
(pretty-print fact-cps)
;; =>
;; '(lambda (n k)
;; ((lambda (fact k) (fact fact (lambda (v0) (v0 n k))))
;; (lambda (fact k)
;; (k
;; (lambda (n k)
;; (if (zero? n)
;; (k 1)
;; (fact
;; fact
;; (lambda (v1) (v1 (sub1 n) (lambda (v2) (k (* n v2))))))))))
;; k))


((eval fact-cps) 5 (lambda (v) v))
;; => 120
