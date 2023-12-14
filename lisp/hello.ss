(define vhello "Hello world!")
(display vhello)
(display "\n")

(define fhello (lambda ()
		 "Hello world!"))
(fhello)

(display "\n")

(define (fhello) "Hello world!")
(fhello)

(display "\n")

fhello

(display "\n")

(define hello (lambda (name)
                (string-append "Hello " name "!")))

(hello "Scheme")

(define (hello name)
  (string-append "Hello " name "!"))

(hello "Scheme")

(display "\n")

(define (1+ x)
  (+ x 1))

(1+ 3)

(define (1- x)
  (- x 1))

(1- 3)

