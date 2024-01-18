(define (constant? exp var)
  (and (atom? exp)
       (not (eq? exp var))))

(define (same-var? exp var)
  (and (atom? exp)
       (eq? exp var)))

(define (sum? exp)
  (and (not (atom? exp))
       (eq? (car exp) '+)))

(define (make-sum a1 a2)
  (list '+ a1 a2))

(define a1 cadr)

(define a2 caddr)

(define (product? exp)
  (and (not (atom? exp))
       (eq? (car exp) '*)))

(define (make-product m1 m2)
  (list '* m1 m2))

(define m1 cadr)

(define m2 caddr)

(define (deriv exp var)
  (cond ((constant? exp var) 0)
        ((same-var? exp var) 1)
        ((sum? exp)
         (make-sum (deriv (a1 exp) var)
                   (deriv (a2 exp) var)))
        ((product? exp)
         (make-sum
           (make-product (m1 exp)
                         (deriv (m2 exp) var))
           (make-product (deriv (m1 exp) var)
                         (m2 exp))))))
; a*x*x + b*x + c
(define foo
  '(+ (* a (* x x))
      (+ (* b x)
         c)))

; 2*a*x + b
(deriv foo 'x)

(newline)

; x*x
(deriv foo 'a)

(newline)

; x
(deriv foo 'b)

(newline)

; 1
(deriv foo 'c)