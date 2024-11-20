;; normal factorial
(define (fact n)
  (if (= n 1)
    1
    (* n (fact (- n 1)))))

(+ 3 (fact 4))


(define (return x)
  x)

(define (k+ a b f)
  (f (+ a b)))

;; CPS factorial
(define (kfact n k)
  (if (= n 1)
    (k 1)
    (kfact (- n 1) (lambda (x) (k (* n x))))))

(kfact 4 (lambda (x) (k+ x 3 return)))
