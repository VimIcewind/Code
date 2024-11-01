(define (member-if proc ls)
  (cond
    ((null? ls) #f)
    ((proc (car ls)) ls)
    (else (member-if proc (cdr ls)))))

(member-if positive? '(0 -1 -2 3 5 -7))

(define (member proc obj ls)
  (cond
    ((null? ls) #f)
    ((proc obj (car ls)) ls)
    (else (member proc obj (cdr ls)))))

(member string=? "hello" '("hi" "guys" "bye" "hello" "see you"))
