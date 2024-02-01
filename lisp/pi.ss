;;; Cesaro's method for estimating Pi:
;;;   Prob(gcd(n1,n2)=1) = 6/(Pi*Pi)

;; TODO random-init and rand-update
(define random-init 0)
(define (rand-update x)
  x)

(define rand
  (let ((x random-init))
    (lambda ()
      (set! x (rand-update x))
      x)))

(define (estimate-pi n)
  (sqrt (/ 6 (monte-carlo n cesaro))))

(define (cesaro)
  (= (gcd (rand) (rand)) 1))

(define (monte-carlo trials experiment)
  (define (iter remaining passed)
    (cond ((= remaining 0)
           (/ passed trials))
          ((experiment)
           (iter (-1+ remaining)
                 (1+ passed)))
          (else
            (iter (-1+ remaining)
                  passed))))
  (iter trials 0))



(define (estimate-pi n)
  (sqrt (/ 6 (random-gcd-test n))))

(define (random-gcd-test trials)
  (define (iter remaining passed x)
    (let ((x1 (rand-update x)))
      (let ((x2 (rand-update x1)))
        (cond ((= remaining 0)
               (/ passed trials))
              ((= (gcd x1 x2) 1)
               (iter (-1+ remaining)
                     (1+ passed)
                     x2))
              (else
                (iter (-1+ remaining)
                      passed
                      x2))))))
  (iter trials 0 random-seed))
