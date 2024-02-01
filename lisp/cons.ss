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

(newline)

(define a (cons 1 2))
(display a)

(newline)

(define b (cons a a))
(display b)

(newline)

(set-car! (car b) 3)
(car a)

(newline)

;; Alonzo Church's hack
(define (cons x y)
  (lambda (m) (m x y)))

(define (car x)
  (x (lambda (a d) a)))

(define (cdr x)
  (x (lambda (a d) d)))

(car (cons 35 47))
(car (lambda (m) (m 35 47)))
((lambda (m) (m 35 47)) (lambda (a d) a))
((lambda (a d) a) 35 47)

;; "Lambda Calculus" Mutable Data

(define (cons x y)
  (lambda (m)
    (m x
       y
       (lambda (n) (set! x n))
       (lambda (n) (set! y n)))))

(define (car x)
  (x (lambda (a d sa sd) a)))

(define (cdr x)
  (x (lambda (a d sa sd) d)))

(define (set-car! x y)
  (x (lambda (a d sa sd) (sa y))))

(define (set-cdr! x y)
  (x (lambda (a d sa sd) (sd y))))
