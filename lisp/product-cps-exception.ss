;; normal
(define (product ls)
  (let loop ((ls ls) (acc 1))
    (cond
      ((null? ls) acc)
      ((zero? (car ls)) 0)
      (else (loop (cdr ls) (* (car ls) acc))))))

(+ 100 (product '(2 4 7)))


(define (return x)
  x)

(define (k+ a b f)
  (f (+ a b)))

(define (non-number-value-error x)
  (display "Value error: ")
  (display x)
  (display " is not number.")
  (newline)
  'error)

;; CPS
(define (kproduct ls k k-value-error)
  (let ((break k))
    (let loop ((ls ls) (k k))
      (cond
        ((null? ls) (k 1))
        ((not (number? (car ls))) (k-value-error (car ls)))
        ((zero? (car ls)) (break 0))
        (else (loop (cdr ls) (lambda (x) (k (* (car ls) x)))))))))

(kproduct '(2 4 7)
          (lambda (x) (k+ x 100 return))
          non-number-value-error)

(kproduct '(2 4 7 hoge)
          (lambda (x) (k+ x 100 return))
          non-number-value-error)
