(car '(1 2 3 4))
(cdr '(1 2 3 4))

(car '(0))
(cdr '(0))

(car '((1 2 3) (4 5 6)))
(cdr '((1 2 3) (4 5 6)))

(car '(1 2 3 . 4))
(cdr '(1 2 3 . 4))

(car (cons 3 (cons 2 (cons 1 '()))))
(cdr (cons 3 (cons 2 (cons 1 '()))))


(car '(a b c))
(cdr '(a b c))
(cdr '(a))

(car (cdr '(a b c)))
(cdr (cdr '(a b c)))

(car '((a b) (c d)))
(cdr '((a b) (c d)))
