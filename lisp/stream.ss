;; TODO

(define (memo-proc proc)
  (let ((already-run? nil) (result nil))
    (lambda ()
      (if (not already-run?)
          (sequence
            (set! result (proc))
            (set! already-run? (not nil))
            result)
          result))))

;; (delay <exp>)
;(define delay (lambda () <exp>))
;(define delay (memo-proc (lambda () <exp>)))
;(define (delay exp) (memo-proc (lambda () exp)))
(define (delay p) (memo-proc (lambda () p)))

;; (force p)
(define (force p)
  (p))

; (cons-stream x y)
(define (cons-stream x y)
  (cons x (delay y)))

; (head s)
(define (head s)
  (car s))

; (tail s)
(define (tail s)
  (force (cdr s)))

; (the-empty-stream)
(define the-empty-stream '())

; (empty-stream? s)
(define (empty-stream? s)
  (null? s))

;; For any x + y
;; (head (cons-stream x y)) -> x
;; (tail (cons-stream x y)) -> y

; (head (tail (filter prime? (e-1 10000 1000000))))

(define (map-stream proc s)
  (if (empty-stream? s)
    the-empty-stream
    (cons-stream
      (proc (head s))
      (map-stream proc (tail s)))))

(define (filter pred s)
  (cond
    ((empty-stream? s) the-empty-stream)
    ((pred (head s))
     (cons-stream (head s)
                  (filter pred
                          (tail s))))
    (else (filter pred (tail s)))))

(define (accumulate combiner init-val s)
  (if (empty-stream? s)
    init-val
    (combiner (head s)
              (accumulate combiner
                          init-val
                          (tail s)))))

(define (enumerate-tree tree)
  (if (leaf-node? tree)
      (cons-stream tree
                   the-empty-stream)
      (append-streams
        (enumerate-tree
          (left-branch tree))
        (enumerate-tree
          (right-branch tree)))))

(define (append-streams s1 s2)
  (if (empty-stream? s1)
    s2
    (cons-stream
      (head s1)
      (append-streams (tail s1)
                      s2))))

(define (enum-interval low high)
  (if (> low high)
    the-empty-stream
    (cons-stream
      low
      (enum-initerval (1+ low) high))))


(define (sum-odd-squares tree)
  (accumulate
    +
    0
    (map
      square
      (filter odd
              (enumerate-tree tree)))))

(define (odd-fibs n)
  (accumulate
    cons
    '()
    (filter
      odd
      (map fib (enum-interval 1 n)))))


;; {{1 2 3 ...} {10 20 30 ...} ...}
(define (flatten st-of-st)
  (accumulate append-streams
              the-empty-stream
              st-of-st))

(define (flatmap f s)
  (flatten (map f s)))


;; GIVEN N : Find all Paids 0 < J < I <= N
;; Such that I + J is prime

;; (flatmap
;;   (lambda (i)
;;     (map
;;       (lambda (j) (list i j))
;;       (enum-interval 1 (-1+ i))))
;;   (enum-interval 1 n))

;; (filter
;;   (lambda (p)
;;     (prime? (+ (car p) (cadr p))))
;;   (flatmap ... ))

;; (define (prime-sum-pairs n)
;;   (map
;;     (lambda (p)
;;       (list (car p)
;;             (cadr p)
;;             (+ (car p) (cadr p))))
;;     (filter ... )))

(define (prime-sumpairs n)
  (map
    (lambda (p)
      (list (car p)
            (cadr p)
            (+ (car p) (cadr p))))
    (filter
      (lambda (p)
        (prime? (+ (car p) (cadr p))))
      (flatmap
        (lambda (i)
          (map
            (lambda (j) (list i j))
            (enum-interval 1 (-1+ i))))
        (enum-interval 1 n)))))

(define (prime-sum-pairs n)
  (collect
    (list i j (+ i j))
    ((i (enum-interval 1 n))
     (j (enum-interval 1 (-1+ i))))
    (prime? (+ i j))))

;; TODO
;; (safe? <Row> <Column> <rest-of-positions>)

;; (define (queens size)
;;   (define (fill-cols k)
;;     (if
;;       (= k 0)
;;       (singleton empty-board)
;;       (collect ...)))
;;   (fill-cols size))

(define (queens size)
  (define (fill-cols k)
    (if
      (= k 0)
      (singleton empty-board)
      (collect
        (adjoin-position try-row
                         k
                         rest-queens)
        ((rest-queens (fill-cols (-1+ k)))
         (try-row (enum-interval 1 size)))
        (safe? try-row k rest-queens))))
  (fill-cols size))

;;; find the second prime between
;;; 10,000 and 1,000,000
(head
  tail (filter
         prime?
         (enum-interval 10000 1000000)))

(define (nth-stream n s)
  (if (= n 0)
      (head s)
      (nth-stream (-1+ n) (tail s))))

(define (print-stream s)
  (cond ((empty-stream? s) "done")
        (else (print (head s))
              (print-stream (tail s)))))

(define (integers-from n)
  (cons-stream
    n
    (integers-from (+ n 1))))

(define integers (integers-from 1))

(nth-stream 20 integers)


(define (no-seven x)
  (not (= (remainder x 7)
          0)))

(define ns (filter no-seven
                   integers))

(nth-stream 100 ns)

(print-stream ns)

(define (sieve s)
  (cons-stream
    (head s)
    (sieve (filter
             (lambda (x)
               (not
                 (divisible? x (head s))))
             (tail s)))))

(define primes
  (sieve (integers-from 2)))

(nth-stream 20 primes)
(print-stream primes)


(define (add-streams s1 s2)
  (cond ((empty-stream? s1) s2)
        ((empty-stream? s2) s1)
        (else
          (cons-stream
            (+ (head s1) (head s2))
            (add-streams (tail s1)
                         (tail s2))))))

(define (scale-stream c s)
  (map-stream (lambda (x) (* x c)) s))


(define ones (cons-stream 1 ones))
(define ones (cons 1 (delay ones)))

(define integers
  (cons-stream 1
               (add-streams integers ones)))

(define fibs
  (cons-stream 0
               (cons-stream 1
                            (add-streams fibs (tail fibs)))))


(define (integral s initial-value dt)
  (define int
    (cons-stream
      initial-value
      (add-streams (scale-stream dt s)
                   int)))
  int)

;; doesn't work
; (define y
;   (integral
;     dy 1 .001))
;
; (define dy
;   (map square y))

(define (integral delayed-s
                  initial-value
                  dt)
  (define int
    (cons-stream
      initial-value
      (let ((s (force delayed-s)))
        (add-streams (scale-stream dt s)
                     int))))
  int)

(define y
  (integral
    (delay dy) 1 .001))

(define dy
  (map square y))


(define (fact-iter n)
  (define (iter product counter)
    (if (> counter n)
      product
      (iter (* counter product)
            (+ counter 1))))
  (iter 1 1))


;; Normal-order

(define x 0)

(define (id n)
  (set! x n)
  n)

(define (inc a) (1+ a))

(define y (inc (id 3)))

;; x ---> 0
;; y ---> 4
;; x ---> 3

(define (make-deposit-account
          balance deposit-stream)
  (cons-stream
    balance
    (make-deposit-account
      (+ balance (head deposit-stream))
      (tail deposit-stream))))
