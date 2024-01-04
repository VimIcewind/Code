(cons 1 2)
(cons 3 (cons 1 2))

(cons #\a (cons 3 "hello"))
(cons (cons 0 1) (cons 2 3))

(cons 'a '())
(cons 'a '(b c))
(cons 'a (cons 'b (cons 'c '())))
(cons '(a b) '(c d))

(car (cons 'a '(b c)))
(cdr (cons 'a '(b c)))
(cons (car '(a b c))
      (cdr '(d e f)))
(cons (car '(a b c))
      (cdr '(a b c)))

(cons 'a 'b)
(cdr '(a . b))
(cons 'a '(b . c))

'(a . (b . (c . ())))

(list 'a 'b 'c)
(list 'a)
(list)
