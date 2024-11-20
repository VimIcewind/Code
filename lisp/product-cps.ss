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

;; CPS
(define (kproduct ls k)
  (let ((break k))
    (let loop ((ls ls) (k k))
      (cond
        ((null? ls) (k 1))
        ((zero? (car ls)) (break 0))
        (else (loop (cdr ls) (lambda (x) (k (* (car ls) x)))))))))

(kproduct '(2 4 7) (lambda (x) (k+ x 100 return)))
