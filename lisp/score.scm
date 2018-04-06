(define (score num)
  (cond
   ((>= num 80) 'A)
   ((>= 79 num 60) 'B)
   ((>= 59 num 40) 'C)
   ((< 40) 'D)))
