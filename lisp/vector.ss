'#(1 2 3)
'#(a 0 #\a)

(define vec '#(0 1 2 3 4 5))
(display vec)
(newline)
(vector? vec)
(newline)
(vector 0 1 2 3 4 5)
(vector-length vec)
(vector-ref vec 0)
(vector-ref vec 5)
(vector-set! vec 5 10)
(display vec)
(newline)
(vector->list vec)
(list->vector '(a b c d e))
(vector-fill! vec 0)
(display vec)
(newline)


(define (vector-add v1 v2)
  (let ((lenv1 (vector-length v1))
        (lenv2 (vector-length v2)))
    (if (= lenv1 lenv2)
      (let ((v (make-vector lenv1)))
        (let loop ((i 0))
          (if (= i lenv1)
            v
            (begin
              (vector-set! v i (+ (vector-ref v1 i) (vector-ref v2 i)))
              (loop (+ 1 i))))))
      (error "different dimensions."))))

(define vec1 '#(0 1 2 3 4 5))
(define vec2 '#(5 4 3 2 1 0))
(vector-add vec1 vec2)

