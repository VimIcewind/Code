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

(define A1 cadr)

(define A2 caddr)

(define (product? exp)
  (and (not (atom? exp))
       (eq? (car exp) '*)))

(define (make-product m1 m2)
  (list '* m1 m2))

(define M1 cadr)

(define M2 caddr)

(define (deriv exp var)
  (cond ((constant? exp var) 0)
        ((same-var? exp var) 1)
        ((sum? exp)
         (make-sum (deriv (A1 exp) var)
                   (deriv (A2 exp) var)))
        ((product? exp)
         (make-sum
           (make-product (M1 exp)
                         (deriv (M2 exp) var))
           (make-product (deriv (M1 exp) var)
                         (M2 exp))))))
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
