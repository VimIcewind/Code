; interger to char
(define (int2char num)
  (if (or (< num 33) (> num 126))
      #f
      (integer->char num)))

