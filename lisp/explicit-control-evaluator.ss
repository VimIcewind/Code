;; Registor usage in evaluator machine

; EXP           expression to be evaluated
; ENV           evaluation environment

; FUN           procedure to be applied
; ARGL          list of evaluated arguments

; CONTINUE      place to go to next

; VAL           result of evaluation

; UNEV          temporary register for expressions



;; Sample evaluator-machine operations

; (assign val (fetch exp))

; (branch
;   (conditional? (fetch exp))
;   ev-cond)

; (assign exp (first-clause (fetch exp)))

; (assign val
;     (lookup-variable-value (fetch exp)
;                            (fetch env)))


;; Contract that eval-dispatch fulfills

; The EXP register holds an expression to be evaluated.
; The ENV register holds the environment in which the expression is to be evaluated.
; The CONTINUE register holds a place to go to next.
; The result will be left in the VAL result. Constents of all other registers may be destroyed.

; (define (eval exp env)
;   (cond ((self-evaluating? exp) exp)
;         ((quoted? exp)
;          (text-of-quotation exp))
;
;         ;; << ... more special forms ...>>
;
;         ((application? exp)
;          (apply
;            (eval (operator exp) env)
;            (list-of-values (operands exp)
;                            env)))
;         (else
;           (error "Unknown expression"))))


;; Contract that apply-dispatch fulfills

; The ARGL register contains a list of arguments.
; The FUN register contains a procedure to be applied.
; The top of the STACK holds a place to go to next.
; The result will be left in the VAL register. The stack will be popped.
; Constents of all other registers may be destroyed.

; (define (apply proc args)
;   (cond ((primitive-proc? proc)
;          (primitive-apply proc args))
;         ((compound-proc? proc)
;          (eval-sequence
;            (proc-body proc)
;            (extend-environment
;              (parameters proc)
;              args
;              (proc-environment proc))))
;         (else
;           (error "Unknown proc type"))))

; E0
; X = 3
; Y = 4

; EXP: 1
; ENV: <E0>
; FUN:
; ARGL:
; CONTINUE: DONE
; VAL: 1
; UNEV:

; EXP: X
; ENV: <E0>
; FUN:
; ARGL:
; CONTINUE: DONE
; VAL: 3
; UNEV:

; E1
; + = <pp +>

; EXP: (+ X Y)
; ENV: <E0>
; FUN:
; ARGL:
; CONTINUE: DONE
; VAL: 3
; UNEV:

(define-machine explicit-control-evaluator
  (registers exp env fun argl continue val unev)
  (controller
    eval-dispatch
      (branch (self-evaluating? (fetch exp))
              ev-self-eval)
      (branch (variable? (fetch exp))
              ev-variable)

      ; << ... more special forms ...>>

      (branch (application? (fetch exp))
              ev-application)
      (goto unknown-expression-error)

    ev-self-eval
      (assign val (fetch exp))
       (goto (fetch continue))

    ev-variable
      (assign
        val
        (lookup-variable-value (fetch exp)))
      (goto (fetch continue))

    ev-application
      (assign unev (operands (fetch exp)))
      (assign exp (operands (fetch exp)))
      (save continue)
      (save env)
      (save uenv)
      (assign continue eval-args)
      (goto eval-dispatch)

    eval-args
      (restore unev)
      (restore env)
      (assign fun (fetch val))
      (save fun)
      (assign argl '())
      (goto eval-arg-loop)

    eval-arg-loop
      (save argl)
      (assign
        exp
        (first-operand (fetch unev)))
      (branch (last-operand? (fetch unev))
              eval-last-arg)
      (save env)
      (save uenv)
      (assign continue accumulate-arg)
      (goto eval-dispatch)

    accumulate-arg
      (restore unev)
      (restore env)
      (restore argl)
      (assign
        argl
        (cons (fetch val) (fetch argl)))
      (assign
        unev
        (rest-operands (fetch unev)))
      (goto eval-arg-loop)

    eval-last-arg
      (assign continue accumulate-last-arg)
      (goto eval-dispatch)

    accumulate-last-arg
      (restore argl)
      (assign
        argl
        (cons (fetch val) (fetch argl)))
      (restore fun)
      (goto apply-dispatch)


    apply-dispatch
      (branch (primitive-proc? (fetch fun))
              primitive-apply)
      (branch (compound-proc? (fetch fun))
              compound-apply)
      (goto unknown-proc-type-error)

    primitive-apply
      (assign
        val
        (apply-primitive-proc (fetch fun)
                              (fetch argl)))
      (restore continue)
      (goto (fetch continue))

    apply-primitive-proc
      ;; TODO apply primitive procdure


    compound-apply
      (assign
        exp
        (procedure-body (fetch fun)))
      (assign
        env
        (make-bindings (fetch fun)
                       (fetch argl)))
      (restore continue)
      (goto eval-dispatch)

    compound-apply
      (assign
        unev
        (procedure-body (fetch fun)))
      (assign
        env
        (make-bindings (fetch fun)
                       (fetch argl)))
      (goto eval-sequence)


   eval-sequence
    (assign exp (firt-exp (fetch unev)))
    (branch (last-exp? (fetch unev))
            last-exp)
    (save unev)
    (save env)
    (assign continue eval-sequence-cont)
    (goto eval-dispatch)

  eval-sequence-cont
    (restore env)
    (restore unev)
    (assign unev (rest-exps (fetch unev)))
    (goto-eval-sequence)

  last-exp
    (restore continue)
    (goto eval-dispatch)

  ))


;; E0:
; x = 3
; y = 4
; F = PROC
;     ARGS a b
;     BODY (+ a b)

;; E1:
; a = 3
; b = 4

(define (f a b)
  (+ a b))

(f x y)




(define (fact-iter n)
  (define (iter product counter)
    (if (> counter n)
      product
      (iter (* counter product)
            (+ counter 1))))
  (iter 1 1))




(define (fact-rec n)
  (if (= n 0)
      1
      (* n (fact-rec (- n 1)))))
