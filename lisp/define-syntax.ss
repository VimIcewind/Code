(define-syntax def
  (syntax-rules ()
    ((def f (p ...) body)
     (define (f p ...)
       body))))

(def f (x)
     (+ x 42))

(f 23)

(define-syntax nil!
  (syntax-rules ()
    ((_ x)
     (set! x '()))))

(nil! x)
x

(define (f-nil! x)
  (set! x '()))

(define a 1)

(f-nil! a)
a

(nil! a)
a


(define-syntax when
  (syntax-rules ()
    ((_ pred b1 ...)
     (if pred (begin b1 ...)))))

(let ((i 0))
  (when (= i 0)
    (display "i == 0")
    (newline)))


(define-syntax while
  (syntax-rules ()
    ((_ pred b1 ...)
     (let loop () (when pred b1 ... (loop))))))

(let ((i 0))
  (while (< i 10)
         (display i)
         (display #\space)
         (set! i (+ i 1))))

(newline)

(define-syntax for
  (syntax-rules ()
    ((_ (i from to) b1 ...)
     (let loop((i from))
       (when (< i to)
         b1 ...
         (loop (1+ i)))))))

(for (i 0 10)
     (display i)
     (display #\space))

(newline)

;; define λ as lambda
(define-syntax λ
  (syntax-rules ()
    ((_ param body ...)
     (lambda param body ...))))

(define (square x) (* x x))

(display (square 5))
(newline)


(define square (lambda (x) (* x x)))

(display (square 5))
(newline)


(define square (λ (x) (* x x)))

(display (square 5))
(newline)


(define double (lambda (x) (* 2 x)))

(define use (lambda (f) (lambda (x) (f x))))

(double 5)
(double 10)
((use double) 5)
((use double) 10)


(define double (λ (x) (* 2 x)))

(define use (λ (f) (λ (x) (f x))))

(double 5)
(double 10)
((use double) 5)
((use double) 10)
