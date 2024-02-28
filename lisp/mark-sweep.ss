(define-machine mark-seep
  (registers a b t)
  (controller
    gc   (assign thing (fetch root))
         (assign continue sweep)
    mark (branch (not-pair? (fetch thing))
                 done)
    pair (assign mark-flag
            (vector-ref (fetch the-marks)
                        (fetch thing)))
          (branch (= (fetch mark-flag) 1)
                  done)
          (perform
            (vector-set! (fetch the-marks)
                         (fetch thing)
                         1))
    mcar  (push thing)
          (push continue)
          (assign continue mcdr)
          (assign thing
            (vector-ref (fetch the-cars)
                        (fetch thing)))
          (goto mark)
    sweep (assign free '())
          (assign scan (-1+ (fetch memtop)))
    slp   (branch (negative? (fetch scan))
                  end)
          (assign mark-flag
            (vector-ref (fetch the-marks)
                        (fetch scan)))
          (branch (= (fetch mark-flag) 1)
                  unmk)
    (perform
      (vector-set! (fetch the-cdrs)
                   (fetch scan)
                   (fetch free)))
      (assign free (fetch scan))
      (assign scan (-1+ (fetch scan)))

      unmk (perform
             (vector-set! (fetch the-marks)
                          (fetch scan)
                          0))
             (assign scan (-1+ (fetch scan)))
             (goto slp)
    done))





(define diag1
  (lambda (p)
    (if (safe? p p)
      (inf)
      3)))

(define inf
  (lambda ()
    ((lambda (x) (x x))
     (lambda (x) (x x)))))


(diag1 diag1)


(define diag2
  (lambda (p)
    (if (safe ? p p)
      (other-than (p p))
      false)))

(define other-than
  (lambda (x)
    (if (eq? x 'A)
      'B
      'A)))

(diag2 diag2)
;; =   ;; no!! !=
(other-than (diag2 diag2))
