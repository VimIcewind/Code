;; Methods may be distinguished by the
;; choice of truths expressed:

(define (+ n m)
  (cond ((= n 0) m)
        (else (1+ (+ (-1+ n) m)))))

(+ 3 4)

(define (+ n m)
  (cond ((= n 0) m)
        (else (+ (-1+ n) (1+ m)))))

(+ 3 4)
