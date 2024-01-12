; representing vectors in the plane

(define make-vector cons)

(define xcor car)

(define ycor cdr)

; representing line segments

(define make-seg cons)

(define seg-start car)

(define seg-end cdr)


(define (average m n)
  (/ (+ m m) 2))

(define (midpoint s)
  (let ((a (seg-start))
        (b (seg-end s)))
    (make-vector
      (average (xcor a) (xcor b))
      (average (ycor a) (ycor b)))))


(define (length s)
  (let
    ((dx (- (xcor (seg-end s))
            (xcor (seg-start s))))
     (dy (- (ycor (seg-end s))
            (ycor (seg-start s)))))
    (sqrt (+ (square dy)
             (square dy)))))

(define (+vect v1 v2)
  (make-vector
    (+ (xcor v1) (xcor v2))
    (+ (ycor v1) (ycor v2))))

(define (scale s v)
  (make-vector
    (* s (xcor v))
    (* s (ycor v))))

(define (map p l)
  (if (null? l)
    '()
    (cons (p (car l))
          (map p (cdr l)))))


(define (scale-list s l)
  (map (lambda (item) (* item s))
       l))

(define (square x)
  (* x x))


(define (for-each proc list)
  (cond ((null? list) "done")
        (else (proc (car list))
              (for-each proc (cdr list)))))

;;TODO

;(define point cons)

;(define xcor car)

;(define ycor cdr)

;(define origin)

;(define horiz)

;(define vert)

;(define scale)

;(define drawline)

;(define make-rect)

;(define r (make-rect ....))

;(define g (make-pict ....make-rect...))

;(g r)

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

;;TODO

;(define above)

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

;;TODO
;(squrae-limit q 2)
