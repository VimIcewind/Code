(define str "hello")

(eq? str str)

(eq? "hello" "hello")

(eq? 1 1)

(eq? 1.0 1.0)

(eqv? 1.0 1.0)

(eqv? 1 1.0)

(eqv? (list 1 2 3) (list 1 2 3))

(eqv? "hello" "hello")

(eqv? (lambda (x) x) (lambda (x) x))

(equal? (list 1 2 3) (list 1 2 3))

(equal? "hello" "hello")
