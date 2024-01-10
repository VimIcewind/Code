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

(make-seg (make-vector 2 3)
          (make-vector 5 1))
