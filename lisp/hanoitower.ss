(define (towers-of-hanoi n source dest temp)
  (cond [(= n 1)
         (printf "Move the disk from ~a to ~a~n" source dest)]
        [else
         (towers-of-hanoi (1- n) source temp dest)
         (printf "Move the disk from ~a to ~a~n" source dest)
         (towers-of-hanoi (1- n) temp dest source)]))

(towers-of-hanoi 1 "source" "dest" "temp")
(newline)
(towers-of-hanoi 2 "source" "dest" "temp")
(newline)
(towers-of-hanoi 3 "source" "dest" "temp")
(newline)
(towers-of-hanoi 4 "source" "dest" "temp")
(newline)

(define (move n from to spare)
  (cond ((= n 0) "Done")
    (else
      (move (1- n) from spare to)
      (printf "move ~a ~a ~a ~a~n" n from to spare)
      (move (1- n) spare to from))))

(move 1 1 2 3)
(newline)
(move 2 1 2 3)
(newline)
(move 3 1 2 3)
(newline)
(move 4 1 2 3)
