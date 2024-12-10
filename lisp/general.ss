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

(define (square x) (* x x))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 前提和定义
(define (attach-tag type-tag contents)
  (cons type-tag contents))
(define (type-tag datum)
  (if (pair? datum)
    (car datum)
    (error "Bad tagged datum : TYPE-TAG " datum )))
(define (contents datum)
  (if (pair? datum)
    (cdr datum)
    (error "Bad tagged datum : CONTENTS " datum )))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; put/get的实现
(define (eql? a b)
  (define (list-eq? a b)
    (cond
      ((and (null? a) (null? b)) #t)
      ((or  (null? a) (null? b)) #f)
      ((eql? (car a) (car b)) (list-eq? (cdr a) (cdr b)))
      (else #f)))
  (cond
    ((and (pair? a) (pair? b)) (list-eq? a b))
    ((not (or (pair? a) (pair? b))) (eq? a b))
    (else #f))
  )
(define (head t) (car t))
(define (tail t) (cdr t))
(define (key kv) (car kv))
(define (val kv) (cdr kv))
(define (make-kv k v) (cons k v))

(define (put-kv table k v)
  (cond
    ((null? table) (list (make-kv k v)))
    ((eql? k (key (head table))) (cons (make-kv k v) (tail table))) ; replace
    (else (cons (make-kv k v) table))))

(define (get-kv table k)
  (cond
    ((null? table) '())
    ((eql? k (key (head table))) (val (head table)))
    (else (get-kv (tail table) k))))

;;; 系统表接口
(define system-table '())
(define (get op type)
  (let ((result (get-kv (get-kv system-table op) type)))
    (if (null? result) #f result)))
(define (put op type item)
  (set! system-table
    (put-kv system-table op (put-kv (get-kv system-table op) type item))))


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
((get 'polar 'real-part) (contents z))
(real-part-polar (cons 1 2))



;; rational numbers
(define (make-rat n d)
  (cons n d))

(define (numer x)
  (let ((g (gcd (car x) (cdr x))))
  (/ (car x) g)))

(define (denom x)
  (let ((g (gcd (car x) (cdr x))))
  (/ (cdr x) g)))


(define (+rat x y)
  (make-rat
    (+ (* (numer x) (denom y))
       (* (numer y) (denom x)))
    (* (denom x) (denom y))))

(define (*rat x y)
  (make-rat
    (* (numer x) (numer y))
    (* (denom x) (denom y))))

;;; installing rational numbers in the
;;; generic arithmetic system
(define (make-rat x y)
  (attach-type 'rational (cons x y)))

;;; Rational number arithmetic

(define (+rat x y)
  (make-rat (ADD (MUL (numer x) (denom y))
               (MUL (denom x) (numer y)))
            (MUL (denom x) (denom y))))

(define (-rat x y)
  (make-rat (SUB (MUL (numer x) (denom y))
               (MUL (denom x) (numer y)))
            (MUL (denom x) (denom y))))

(define (*rat x y)
  (make-rat
    (MUL (numer x) (numer y))
    (MUL (denom x) (denom y))))

(define (/rat x y)
  (make-rat
    (MUL (numer x) (denom y))
    (MUL (denom x) (numer y))))

(put 'rational 'add +rat)
(put 'rational 'sub -rat)
(put 'rational 'mul *rat)
(put 'rational 'div /rat)


;;; install complex numbers

(define (make-complex z)
  (attach-type 'complex z))

(define (+complex z1 z2)
  (make-complex (+c z1 z2)))

(put 'complex 'add +complex)

(define (-complex z1 z2)
  (make-complex (-c z1 z2)))

(put 'complex 'sub -complex)

(define (*complex z1 z2)
  (make-complex (*c z1 z2)))

(put 'complex 'mul *complex)

(define (/complex z1 z2)
  (make-complex (/c z1 z2)))

(put 'complex 'div /complex)


;;; install oridinary numbers

(define (make-number n)
  (attach-type 'number n))

(define (+number x y)
  (make-number (+ x y)))

(put 'number 'add +number)

(define (-number x y)
  (make-number (- x y)))

(put 'number 'sub -number)

(define (*number x y)
  (make-number (* x y)))

(put 'number 'mul *number)

(define (/number x y)
  (make-number (/ x y)))

(put 'number 'div /number)

;;;;

(define (operate-2 op arg1 arg2)
  (if
    (eq? (type arg1) (type arg2))
    (let ((proc (get (type arg1) op)))
      (if (not (null? proc))
          (proc (contents arg1)
                (contents arg2))
          (error
            "Op undefined on type")))
    (error "Args not same type")))


;; x^15 + 2x^7 + 5
;; ((15 1) (7 2) (0 5))
;; (polynomial x <term-list>)


;;; Installing polynomials
(define (make-polynomial var term-list)
  (attach-type 'polynomial
               (cons var term-list)))

(define (+terms l1 l2)
  (cond ((empty-termlist? l1) l2)
        ((empty-termlist? l2) l1)
        (else
          (let ((t1 (first-term l1))
                (t2 (first-term l2)))
            (cond
              ((> (order t1) (order t2))
               (adjoin-term
                 t1
                 (+terms (rest-terms l1) l2)))
              ((< (order t1) (order t2))
               (adjoin-term
                 t2
                 (+terms l1 (rest-terms l2))))
              (else
                (adjoin-term
                  (make-term (order t1)
                             (ADD (coeff t1)
                                  (coeff t2)))
                  (+terms (rest-terms l1)
                          (rest-terms l2))))
            )))))


(define (+poly p1 p2)
  (if (same-var? (var p1) (var p2))
    (make-polynomial
      (var p1)
      (+terms (term-list p1)
              (term-list p2)))
    (error "Polys not in same var")))

(put 'polynomial 'add +poly)

