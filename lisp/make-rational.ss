(define (make-rational n d) (cons n d))
(define (numerator x) (car x))
(define (denominator x) (cdr x))

(define (print-rat x)
    (display (numerator x))
    (display "/")
    (display (denominator x)))

(define one-half (make-rational 1 2))

(print-rat one-half)
(newline)


(define (make-gcd a b)
  (if (= b 0)
    a
    (make-gcd b (remainder a b))))

(define (make-rational n d)
  (let ((m (make-gcd n d)))
    (cons (/ n m) (/ d m))))

(define (numerator x) (car x))
(define (denominator x) (cdr x))

(define (print-rat x)
    (display (numerator x))
    (display "/")
    (display (denominator x)))

(define four-sixth (make-rational 4 6))

(print-rat one-half)
(newline)
(print-rat four-sixth)
(newline)
