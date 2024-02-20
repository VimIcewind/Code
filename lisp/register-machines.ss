(define-machine gcd
  (registers a b t)
  (controller
    loop (branch (zero? (fetch b)) DONE)
         (assign t (remainder (fetch a) (fetch b)))
         (assign a (fetch b))
         (assign b (fetch t))
         (goto loop)
    done))

(define-machine gcd
  (registers a b t)
  (controller
    main (assign a (read))
         (assign b (read))
    loop (branch (zero? (fetch b)) DONE)
         (assign t (remainder (fetch a) (fetch b)))
         (assign a (fetch b))
         (assign b (fetch t))
         (goto loop)
    done (perform (print (fetch a)))
         (goto main)))


(define (remainder n d)
  (if (< n d)
      n
      (remainder (- n d) d)))

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

(gcd 30 42)


(define-machine fact
  (registers val n continue)
  (controller
    main
         (assign continue done)
    loop (branch (=1 (fetch n)) base)
         (save continue)
         (save n)
         (assign n (-1+ (fetch n)))
         (assign continue aft)
         (goto loop)
    aft  (restore n)
         (restore continue)
         (assign val (* (fetch n) (fetch val)))
         (goto (fetch continue))
    base (assign val (fetch n))
         (goto (fetch continue))
    done
   ))

(define (fact n)
  (if (= n 1)
      1
      (* n (fact (- n 1)))))

(fact 3)


(define-machine fib
  (registers val n continue)
  (controller
    main
         (assign continue fib-done)
    fib-loop     ; n contains arg, coutinue is recipient
         (branch (< (fetch n) 2) immediate-ans)
         (save continue)
         (assign continue after-fib-n-1)
         (save n)
         (assign n (- (fetch n) 1))
         (goto fib-loop)
    after-fib-n-1
         (restore n)
         ;; (restore continue)
         (assign n (- (fetch n) 2))
         ;; (save continue)
         (assign continue after-fib-n-2)
         (save val)
         (goto fib-loop)
    after-fib-n-2
         (assign n (fetch val)) ; fib(n-2)
         (restore val)
         (restore continue)
         (assign val
                 (+ (fetch val) (fetch n)))
         (goto (fetch counting))
    immediate-ans
         (assign val (fetch n))
         (goto (fetch continue))
    fib-done
   ))

(define (fib n)
  (if (< n 2)
      n
      (+ (fib (- n 1)) (fib (- n 2))))))
