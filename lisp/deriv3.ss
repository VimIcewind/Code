(define (match pat exp dict)
  (cond ((eq? dict 'failed) 'failed)
        ((atom? pat)
         (if (atom? exp)
             (if (eq? pat exp)
                 dict
                 'failed)
             'failed))
        ((arbitrary-constant? pat)
         (if (constant? exp)
             (extend-dictionary pat exp dict)
             'failed))
        ((arbitrary-variable? pat)
         (if (variable? exp)
             (extend-dictionary pat exp dict)
             'failed))
        ((arbitrary-expression? pat)
         (extend-dictionary pat exp dict))
        ((atom? exp) 'failed)
        (else
          (match (cdr pat)
                 (cdr exp)
                 (match (car pat)
                        (car exp)
                        dict)))))

(define (evaluate form dict)
  (if (atom? form)
      (lookup form dict)
      (apply
        (eval (lookup (car form) dict)
              user-initial-environment)
        (mapcar (lambda (v)
                  (lookup v dict))
                (cdr form)))))

(define (skeleton-evaluation? skeleton)
  (if (pair? skeleton) (eq? (car skeleton) ':) false))

(define (eval-exp evaluation) (cadr evaluation))

(define (instantiate skeleton dict)
  (define (loop s)
    (cond ((atom? s) s)
          ((skeleton-evaluation? s)
           (evaluate (eval-exp s) dict))
          (else (cons (loop (car s))
                      (loop (cdr s))))))
  (loop skeleton))

(define (simplifier the-rules)
  (define (simplifier-exp exp)
    (try-rules (if (compound? exp)
                   (map simplifier-exp exp)
                   exp)))

  (define (try-rules exp)
    (define (scan rules)
      (if (null? rules)
          exp
          (let ((dict
                  (match (pattern (car rules))
                         exp
                         (empty-dictionary))))
            (if (eq? dict 'failed)
              (scan (cdr rules))
              (simplifier-exp
                (instantiate
                  (skeleton (car rules))
                  dict))))))
    (scan the-rules))

  simplifier-exp)

(define (empty-dictionary) '())

(define (extend-dictionary pat dat dict)
  (let ((name (variable-name pat)))
    (let ((v (assq name dict)))
      (cond ((not v)
            (cons (list name dat) dict))
            ((eq? (cadr v) dat) dict)
            (else 'failed)))))

(define (lookup var dict)
  (let ((v (assq var dict)))
    (if (null? v) var (cadr v))))

(define (compound? exp) (pair? exp))

(define (constant? exp) (number? exp))

(define (variable? exp) (atom? exp))

(define (pattern rule) (car rule))

(define (skeleton rule) (cadr rule))

(define (arbitrary-constant? pattern)
  (if (pair? pattern) (eq? (car pattern) '?c) false))

(define (arbitrary-expression? pattern)
  (if (pair? pattern) (eq? (car pattern) '?) false))

(define (arbitrary-variable? pattern)
  (if (pair? pattern) (eq? (car pattern) '?v) false))

(define (variable-name pattern) (cadr pattern))

(define deriv-rules
  '(
    (  (dd (?c c) (? v))                   0 )
    (  (dd (?v v) (? v))                   1 )
    (  (dd (?v u) (? v))                   0 )

    (  (dd (+ (? x1) (? x2)) (? v))
       (+ (dd (: x1) (: v))
          (dd (: x2) (: v)))                 )

    (  (dd (* (? x1) (? x2)) (? v))
       (+ (* (: x1) (dd (: x2) (: v)))
          (* (dd (: x1) (: v)) (: x2)))      )

    (  (dd (** (? x) (?c n)) (? v))
       (* (* (: n)
             (** (: x) (: (- n 1))))
          (dd (: x) (: v)))                  )
    ))

(define dsimp
  (simplifier deriv-rules))

(dsimp '(dd (+ x y) x))

(define algebra-rules
  '(
    (  ((? op) (?c e1) (?c e2))
       (: (op e1 e2))                        )

    (  ((? op) (? e1) (?c e2))
       ((: op) (: e2) (: e1))                )

    (  (+ 0 (? e))                    (: e)  )

    (  (* 1 (? c))                    (: e)  )

    (  (* 0 (? e))                    0      )

    (  (* (?c e1) (* (?c e2) (? e3)))
       (* (: (* e1 e2)) (: e3))              )

    (  (* (? e1) (* (?c e2) (? e3)))
       (* (: e2) (* (: e1) (: e3)))          )

    (  (* (* (? e1) (? e2)) (? e3))
       (* (: e1) (* (: e2) (: e3)))          )

    (  (+ (?c e1) (* (?c e2) (? e3)))
       (+ (: (* e1 e2)) (: e3))              )

    (  (+ (? e1) (+ (?c e2) (? e3)))
       (+ (: e2) (+ (: e1) (: e3)))          )

    (  (+ (+ (? e1) (? e2)) (? e3))
       (+ (: e1) (+ (: e2) (: e3)))          )

    (  (+ (* (?c c) (? a)) (* (?c d) (? a)))
       (* (: (+ c d)) (: a)))

    (  (* (? c) (+ (? d) (? e)))
       (+ (* (: c) (: d)) (* (: c) (: e)))   )
    ))
