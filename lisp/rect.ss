(define (coord-map rect)
  (lambda (point)
    (+vect
      (+vect (scale (xcor point)
                    (horiz rect))
             (scale (ycor point)
                    (vert rect)))
      (origin rect))))

; Construciting Primitive Pictures from Lists of Segments
(define (make-picture seglist)
  (lambda (rect)
    (for-each
      (lambda (s)
        (drawline
          ((coord-map rect) (seg-start s))
          ((coord-map rect) (seg-end s))))
      seglist)))

;(define r (make-rect ....))

;(define g (make-pict ....make-rect...))

;(g r)

(define (beside p1 p2 a)
  (lambda (rect)
    (p1 (make-rect
          (origin rect)
          (scale a (horiz rect))
          (vert rect)))
    (p2 (make-rect
          (+vect (origin rect)
                 (scale a (horiz rect)))
          (scale (- 1 a) (horiz rect))
          (vert rect)))))

(define (rotate90 pict)
  (lambda (rect)
    (pict (make-rect
            (*vect (origin rect)
                   (horiz rect))
            (vert rect)
            (scale -1 (horiz rect))))))


(define (right-push p n a)
  (if (= n 0)
    p
    (beside p (right-push p
                          (-N 1)
                          a)
            a)))

(define (push comb)
  (lambda (pict n a)
    ((repeated
       (lambda (p) (comb pict p a))
       n)
     pict)))

(define right-push (push beside))
