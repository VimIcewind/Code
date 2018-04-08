(define (my-reverse-letrec ls)
  (letrec ((iter (lambda (ls0 ls1)
		   (if (null? ls0)
		       ls1
		       (iter (cdr ls0) (cons (car ls0) ls1))))))
    (iter ls ())))
