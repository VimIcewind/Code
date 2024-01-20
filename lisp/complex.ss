;;; Arithmethic operations on
;;; complex numbers

; (define (+c z1 z2) ...)

; (define (-c z1 z2) ...)

; (define (*c z1 z2) ...)

; (define (/c z1 z2) ...)

;;; Z1 + Z2
;; Re(Z1 + Z2) = (Re Z1) + (Re Z2)
;; Im(Z1 + Z2) = (Im Z1) + (Im Z2)

;;; Z1 * Z2
;; Mag(Z1 * Z2) = (Mag Z1) * (Mag Z2)
;; Angle(Z1 * Z2) = (Angle Z1) + (Angle Z2)

;;; Selectors
; (real-part z)
; (imag-part z)
; (magnitude z)
; (angle z)

;;; Constructors
; (make-rectangular x y)
; (make-polar r a)


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
  (attach-type 'rectangular (cons x y)))

(define (real-part-rectangular z)
  (car z))

(define (imag-part-rectangular z)
  (cdr z))

(define (magnitude-rectangular z)
  (sqrt (+ (square (car z))
           (square (cdr z)))))

(define (angle-rectangular z)
  (atan (cdr z) (car z)))


;;; Representing complex numbers as
;;; pairs magnitude, angle
(define (make-polar r a) (cons r a))

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


;;; (put key1 key2 value)
;;; (get key1 key2)

;;; Installing the rectangular
;;; operations in the table

(put 'rectangular 'real-part real-part-rectangular)

(put 'rectangular 'imag-part imag-part-rectangular)

(put 'rectangular 'magnitude magnitude-rectangular)

(put 'rectangular 'angle angle-rectangular)

;;; Installing the polar
;;; operations in the table
(put 'polar 'real-part real-part-polar)

(put 'polar 'imag-part imag-part-polar)

(put 'polar 'magnitude magnitude-polar)

(put 'polar 'angle angle-polar)


(define (operate op obj)
  (let ((proc (get (type obj) op)))
    (if (not (null? proc))
        (proc (contents obj))
        (error "undefined op"))))

(define (real-part obj)
  (operate 'real-part obj))

(define (imag-part obj)
  (operate 'imag-part obj))

(define (magnitude obj)
  (operate 'magnitude obj))

(define (angle obj)
  (operate 'angle obj))


(define z (cons 'polar (cons 1 2)))
(real-part z)
(operate 'real-part z)
((get 'Polar 'real-part) (constents z))
(real-part-polar (cons 1 2))

