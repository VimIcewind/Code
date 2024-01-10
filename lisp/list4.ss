(cons 1 (cons 2 (cons 3 (cons 4 '()))))

(list 1 2 3 4)

(define 1-to-4 (list 1 2 3 4))

(car (cdr 1-to-4))
(car (cdr (cdr 1-to-4)))
1-to-4
(cdr 1-to-4)
(cdr (cdr 1-to-4))
(cdr (cdr (cdr (cdr 1-to-4))))

(define (scale-list s l)
  (if (null? l)
    '()
    (cons (* (car l) s)
          (scale-list s (cdr l))))))

(scale-list 10 1-to-4)

(define (map p l)
  (if (null? l)
    '()
    (cons (p (car l))
          (map p (cdr l)))))


(define (scale-list s l)
  (map (lambda (item) (* item s))
       l))

(scale-list 10 1-to-4)

(define (square x)
  (* x x))

(map square 1-to-4)

(map (lambda (x) (+ x 10)) 1-to-4)


(define (for-each proc list)
  (cond ((null? list) "done")
        (else (proc (car list))
              (for-each proc (cdr list)))))

(for-each display 1-to-4)
