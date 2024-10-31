(define (sum a b)
  (+ a b))

(sum 1 2)

(define sum (lambda (a b)
              (+ a b)))

(sum 1 2)


(define hi (lambda () "Hello ChezScheme!"))
(hi)

(define hello
  (lambda (name)
    (string-append "Hello " name "!")))
(hello "ChezScheme")

(define sum3
  (lambda (a b c)
    (+ a b c)))
(sum3 1 2 3)

(define (hello name)
  (string-append "Hello " name "!"))
(hello "ChezScheme")

(define (sum3 a b c)
  (+ a b c))
(sum3 1 2 3)
