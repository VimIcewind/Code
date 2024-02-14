;; 3 ---> 3
;; x ---> 3 ; car ---> #[PROCEDURE]
;; 'foo ===> (quote foo) ---> foo
;; (λ(x) (+ x y)) ---> (closure ((x) (+ x y)) <env>)
;; (cond (p1 e1) (p2 e2) ...)
;; (+ x 3) ---> do add
(define eval
  (lambda (exp env)
    (cond ((number? exp) exp)
          ((symbol? exp) (lookup exp env))
          ((eq? (car exp) 'quote) (cadr exp))
          ((eq? (car exp) 'lambda)
           (list 'closure (cdr exp) env))
          ((eq? (car exp) 'cond)
           (evcond (cdr exp) env))
          (else (apply (undelay (eval (car exp)
                                      env))
                       (cdr exp)
                       env)))))

(define apply
  (lambda (proc ops env)
    (cond ((primitive? proc)
           (apply-primop proc
                         (evlist ops env)))
          ((eq? (car proc) 'closure)
           (eval (cadadr proc)
                 (bind (vnames (caadr proc))
                       (gevlist (caadr proc)
                                ops
                                env)
                       (caddr proc))))
          (else error-unknown-procedure))))

(define evlist
  (lambda (l env)
    (cond ((eq? l '()) '())
          (else
            (cons (undelay (eval (car l) env))
                  (evlist (cdr l) env))))))

(define gevlist
  (lambda (vars exps env)
    (cond
      ((eq? exps '()) '())
      ((symbol? (car vars))
       (cons (eval (car exps) env)
             (gevlist (cdr vars)
                      (cdr exps)
                      env)))
      ((eq? (caar vars) 'name)
       (cons (make-delay (car exps) env)
             (gevlist (cdr vars)
                      (cdr exps)
                      env)))
      (else error-unknown-declaration))))

(define evcond
  (lambda (clauses env)
    (cond ((eq? clauses '()) '())
          ((eq? (caar clauses) 'else)
           (eval (cadar clauses) env))
          ((false? (undelay
                     (eval (caar clauses)
                           env)))
           (evcond (cdr clauses) env))
          (else
            (eval (cadar clauses) env)))))

(define make-delay
  (lambda (exp env)
    (cons 'thunk (cons exp env))))

(define (undelay v)
  (cond ((pair? v)
         (cond ((eq? (car v) 'thunk)
                (undelay
                  (eval (cadr thunk)
                        (cddr thunk))))
               (else v)))
        (else v)))

(define bind
  (lambda (vars vals env)
    (cons (pair-up vars vals)
          env)))

(define pair-up
  (lambda (vars vals)
    (cond
      ((eq? vars '())
       (cond ((eq? vals '()) '())
             (else (error TMA))))
      ((eq? vals '()) (error TFA))
      (else
        (cons (cons (car vars)
                    (car vals))
              (pair-up (cdr vars)
                       (cdr vals)))))))

(define lookup
  (lambda (sym env)
    (cond ((eq? env '()) (error UBV))
          (else
            ((lambda (vcell)
               (cond ((eq? vcell '())
                      (lookup sym
                              (cdr env)))
                     (else (cdr vcell))))
             (assq sym (car env)))))))

(define assq
  (lambda (sym alist)
    (cond ((eq? alist '()) '())
          ((eq? sym (caar alist))
           (car alist))
          (else
            (assq sym (cdr alist))))))



(eval '(((lambda (x) (lambda (y) (+ x y))) 3) 4) <e0>)

(apply (eval '((lambda (x) (lambda (y) (+ x y))) 3) <e0>)
       (evlist '(4) <e0>))

(apply (eval '((lambda (x) (lambda (y) (+ x y))) 3) <e0>)
       (cons (eval '4 <e0>)
             (evlist '() <e0>)))

(apply (eval '((lambda (x) (lambda (y) (+ x y))) 3) <e0>)
       (cons 4 '()))

(apply (eval '((lambda (x) (lambda (y) (+ x y))) 3) <e0>)
       '(4))

(apply (apply (eval '(lambda (x) (lambda (y) (+ x y))) <e0>)
              '(3))
       '(4))

(apply (apply '(clauses ((x) (lambda (y) (+ x y))) <e0>)
              '(3))
       '(4))

(apply (eval '(lambda (y) (+ x y)) <e1>)
       '(4))

(apply '(clauses ((y) (+ x y)) <e1>)
       '(4))

(eval '(+ x y) <e2>)

(apply (eval '+ <e2>)
       (evlist '(x y) <e2>))

(apply 'ξ '(3 4))

7


(((lambda (x)
    (lambda (y)
      (+ x y)))
  3)
 4)



(define expt
  (lambda (x n)
    (cond ((= n 0) 1)
          (else
            (* x (expt x (- n 1)))))))

;; expt is a fixed-point of f
f = (lambda (g)
  (lambda (x n)
    (cond ((= n 0) 1)
          (else
            (* x
               (g x (- n 1)))))))


y = (lambda (f)
      ((lambda (x) (f (x x)))
       (lambda (x) (f (x x)))))

(y f) = ((lambda (x) (f (x x)))
         (lambda (x) (f (x x))))
      = (f ((lambda (x) (f (x x))) (lambda (x) (f (x x)))))

(y f) = (f (y f))
