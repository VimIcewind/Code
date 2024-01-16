;;; Selectors
(real-part z)
(imag-part z)
(magnitude z)
(angle z)

;;; Constructors

;;; Representing complex numbers as
;;; pairs real-part, imaginary-part
(define (make-rectangular x y)
  (cons x y))

(define (real-part z) (car z))

(define (imag-part z) (cdr z))

(define (make-polar r a)
  (cons (* r (cos a)) (* r (sin a))))

(define (magnitude z)
  (sqrt (+ (square (car z))
           (square (cdr z)))))

(define (angle z)
  (atan (cdr z) (car z)))

;;; Rectangular package

(define (make-rectangular x y)
  (attach-type (cons x y)))

(define (real-part-rectangular z)
  (car z))

(define (imag-part-rectangular z)
  (cdr z))

(define (magnitude-tectangular z)
  (sqrt (+ (square (car z))
           (square (cdr z)))))

(define (angle-rectangular z)
  (atan (cdr z) (car z)))


;;; Representing complex numbers as
;;; pairs magnitude, angle
(define make-polar r a) (cons r a))

(define (magnitude z) (car z))

(define (angle z) (cdr z))

(define (make-rectangular x y)
  (cons (sqrt (+ (square x) (square y)))
        (atan y x)))

(define (real-part z)
  (* (car z) (cos (cdr z))))

(define (imag-part z)
  (* (car z) (sin (cdr z))))

;;; Polar package
(define (make-polar r a)
  (attach-type 'polar (cons r a)))

(define (real-part-polar z)
  (* (car z) (cos (cdr z))))

(define (imag-part-polar z)
  (* (car z) (sin (cdr z))))

(define (magnitude-polar z) (car z))

(define (angle-polar z) (cdr z))


;; Generic selectors for complex numbers
(define (real-part z)
  (cond ((rectangular? z)
         (real-part-rectangular
           (contents z)))
        ((polar? z)
         (real-part-polar
           (contents z)))))

(define (imag-part z)
  (cond ((rectangular? z)
         (imag-part-rectangular
           (contents z)))
        ((polar? z)
         (imag-part-polar
           (contents z)))))

(define (magnitude z)
  (cond ((rectangular? z)
         (magnitude-tectangular
           (contents z)))
        ((polar? z)
         (magnitude-polar
           (contents z)))))

(define (angle z)
  (cond ((rectangular? z)
         (angle-rectangular
           (contents? z)))
        ((polar? z)
         (angle-polar
           (contents z)))))


;;; Support mechanism for mainifest types
(define (attach-type type contents)
  (cons type contents))

(define (type datum)
  (car datum))

(define (contents datum)
  (cdr datum))

;;; type predicates
(define (rectangular? z)
  (eq? (type z) 'rectangular))

(define (polar? z)
  (eq? (type z) 'polar))

;;; Arithmetic operations on
;;; complex numbers
(define (+c z1 z2)
  (make-rectangular
    (+ (real-part z1) (real-part z2))
    (+ (imag-part z1) (imag-part z2))))

(define (-c z1 z2)
  (make-rectangular
    (- (real-part z1) (real-part z2))
    (- (imag-part z1) (imag-part z2))))

(define (*c z1 z2)
  (make-polar
    (* (magnitude z1) (magnitude z2))
    (+ (angle z1) (angle z2))))

(define (/c z1 z2)
  (make-polar
    (/ (magnitude z1) (magnitude z2))
    (- (angle z1) (angle z2))))

