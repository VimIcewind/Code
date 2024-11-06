(define tree '((1 2) (3 4 5) (6 7 8 9)))
tree

(set-car! (car tree) 100)
tree

(define (third ls)
  (caddr ls))

(set-cdr! (third tree) '(a b c))
tree
