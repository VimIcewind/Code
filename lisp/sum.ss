(define (sum-int a b)
  (if (> a b)
      0
      (+ a
         (sum-int (1+ a) b))))

(sum-int 3 4)


(define (sum-sq a b)
  (if (> a b)
      0
      (+ (square a)
         (sum-sq (1+ a) b))))

(define (square x)
  (* x x))

(sum-sq 3 4)


(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1 (* a (+ a 2)))
         (pi-sum (+ a 4) b))))

(pi-sum 3 4)
(newline)


(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term
              (next a)
              next
              b))))

(define (sum-int a b)
  (define (identity x) x)
  (sum identity a 1+ b))

(define (sum-sq a b)
  (sum square a 1+ b))

(define (pi-sum a b)
  (sum (lambda (i) (/ 1 (* i (+ i 2))))
       a
       (lambda (i) (+ i 4))
       b))

(sum-int 3 4)
(sum-sq 3 4)
(pi-sum 3 4)

(newline)

(define (sum term a next b)
  (define (iter j ans)
    (if (> j b)
        ans
        (iter (next j)
              (+ (term j) ans))))
  (iter a 0))

(define (sum-int a b)
  (define (identity x) x)
  (sum identity a 1+ b))

(define (sum-sq a b)
  (sum square a 1+ b))

(define (pi-sum a b)
  (sum (lambda (i) (/ 1 (* i (+ i 2))))
       a
       (lambda (i) (+ i 4))
       b))

(sum-int 3 4)
(sum-sq 3 4)
(pi-sum 3 4)
