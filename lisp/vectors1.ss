; representing vectors in the plane

(define (make-vector x y) (cons x y))

(define (xcor p) (car p))

(define (ycor p) (cdr p))

; representing line segments

(define (make-seg p q) (cons p q))

(define (seg-start s) (car s))

(define (seg-end s) (cdr s))


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

(define (length s)
  (let
    ((dx (- (car (car s))
            (car (cdr s))))
     (dy (- (cdr (car s))
            (cdr (cdr s)))))
  (sqrt (+ (square dy)
           (square dy)))))
