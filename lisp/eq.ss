(define str "hello")

; eq?     address
; eqv?    type and value
; equal?  list, string

; #t
(eq? str str)

; #f
(eq? "hello" "hello")

; #t
(eq? 1 1)

; #f
(eq? 1.0 1.0)

; #t
(eqv? 1.0 1.0)

; #f
(eqv? 1 1.0)

; #f
(eqv? (list 1 2 3) (list 1 2 3))

; #f
(eqv? "hello" "hello")

; #f
(eqv? (lambda (x) x) (lambda (x) x))

; #t
(equal? (list 1 2 3) (list 1 2 3))

; #t
(equal? "hello" "hello")
