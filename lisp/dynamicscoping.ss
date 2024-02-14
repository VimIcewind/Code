(define sum
  (lambda (term a next b)
    (cond ((> a b) 0)
          (else
            (+ (term a)
               (sum term
                    (next a)
                    next
                    b))))))

(define sum-powers
  (lambda (a b n)
    (sum (lambda (x) (expt x n))
         a
         1+
         b)))

(define sum-powers
  (lambda (a b n)
    (sum nth-power
         a
         1+
         b)))

(define product-powers
  (lambda (a b n)
    (product (lambda (x) (expt x n))
             a
             1+
             b)))

(define product-powers
  (lambda (a b n)
    (product nth-power
             a
             1+
             b)))

(define nth-power
  (lambda (x)
    (expt x n)))


(define pgen
  (lambda (n)
    (lambda (x) (expt x n))))

(define sum-powers
  (lambda (a b n)
    (sum (pgen n) a 1+ b)))

(define product-powers
  (lambda (a b n)
    (product (pgen n) a 1+ b)))
